# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd
    # Nix-Index-Database
    inputs.nix-index-database.nixosModules.nix-index

    # You can also split up your configuration and import pieces of it here:
    ./services

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })

      # Fix Build Issue with Cliphist
      (final: prev: {
        cliphist = prev.cliphist.overrideAttrs (_old: {
          src = final.fetchFromGitHub {
            owner = "sentriz";
            repo = "cliphist";
            rev = "c49dcd26168f704324d90d23b9381f39c30572bd";
            sha256 = "sha256-2mn55DeF8Yxq5jwQAjAcvZAwAg+pZ4BkEitP6S2N0HY=";
          };
          vendorHash = "sha256-M5n7/QWQ5POWE4hSCMa0+GOVhEDCOILYqkSYIGoy/l0=";
        });
      })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
      # Cachix (A Simple way to avoid building large programs)
      substituters = [
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
    # Opinionated: disable channels
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  # Enable Networking
  networking = {
    hostName = "Spherical-Nix";
    networkmanager = {
      enable = true;
      # Cloudflare DNS
      insertNameservers = ["1.1.1.1" "1.0.0.1"];
    };
    firewall = {
      enable = true;
      # Trusted Sources: Local Send, Syncthing
      allowedTCPPorts = [53317 8384 22000];
      allowedUDPPorts = [22000 21027];
    };
  };

  # Time Zone
  time.timeZone = "Asia/Manila";

  # System Locale
  i18n = {
    defaultLocale = "en_PH.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_PH.UTF-8";
      LC_IDENTIFICATION = "en_PH.UTF-8";
      LC_MEASUREMENT = "en_PH.UTF-8";
      LC_MONETARY = "en_PH.UTF-8";
      LC_NAME = "en_PH.UTF-8";
      LC_NUMERIC = "en_PH.UTF-8";
      LC_PAPER = "en_PH.UTF-8";
      LC_TELEPHONE = "en_PH.UTF-8";
      LC_TIME = "en_PH.UTF-8";
    };
  };
  hardware = {
    # Enable 3D Graphics
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = [pkgs.mesa.drivers pkgs.amdvlk];
      extraPackages32 = [pkgs.driversi686Linux.mesa.drivers pkgs.driversi686Linux.amdvlk];
    };
    # Setup Drawing Tablet with OpenTabletDriver
    opentabletdriver.enable = true;
  };

  services = {
    # Display-Manager/Login Screen
    displayManager.sddm.enable = true;

    # Xorg/X11
    xserver = {
      enable = true;
      videoDrivers = ["amdgpu"];
      desktopManager = {
        xterm.enable = false;
        xfce.enable = true;
        #noDesktop = true;
        #enableXfwm = false;
      };
      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks
          luadbi-mysql
        ];
      };

      xkb = {
        layout = "ph";
        options = "shift:both_capslock";
      };
    };
    # Enable Pipewire as the Audio Manager
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      #jack.enable = true;
    };
    # Enable Printing with CUPS
    printing = {
      enable = true;
      drivers = [pkgs.gutenprint];
    };
    # Usually used for connecting to network storages
    # Required to make trash:// viewable on GUI filemanagers
    gvfs.enable = true;
  };

  # Initallize Gnome-Polkit Service
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  security = {
    # Recommended to make Pipewire work
    # NOT ROOTKIT!!
    rtkit.enable = true;
    polkit.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    fish.enable = true;
    # Wrap and Install Comma
    # Run packages Without Installing or Running 'nix-shell'
    nix-index-database.comma.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };
    # Run unpatched dynamic binaries on NixOS.
    nix-ld.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    gamemode.enable = true;
  };

  # List of installed packages
  environment = {
    systemPackages = with pkgs; [
      # Nix related packages
      nh # Nix-Helper
      alejandra # Configuration Formatter to Match Specific Style-Rules
      manix # Fast CLI Documentation Searcher for nix
      nix-init # Easilly Generate Nix-Packages from urls
      nix-du # Storage Analyzer for /nix
      # Useful CLI Packages
      alsa-utils # Extra Utilities for Audio Management
      playerctl # Pause, Play, Change Volume, etc
      libnotify # Extra Utilities for Managing Notifications
      tldr # Print examples for certain cli commands
      trash-cli # Recycle-bin for linux
      xclip # Clipboard Manager for Xorg/x11
      wl-clipboard # Clipboard Manager for Wayland
      wl-clip-persist # Persist Clipboard History when Closing Programs
      cliphist # Clipboard History
      lf # File-Manager
      neovim # Preferred text editor
      git # Manage Projects/Dotfiles With Git!
      xdg-user-dirs # Automatically Create or Modify User Folders
      # Better CLI alternatives
      lsd # Better 'ls'
      fd # Better 'find'
      btop # Better 'htop'/Terminal Task-Manager
      ripgrep # Better 'grep'
      bat # Better 'cat'
      # DE/WM/GUI starter kit!
      kitty # Terminal of Choice!
      polkit # Password Prompt for GUI Programs that require root
      polkit_gnome # Polkit Style
      # Wine, Make Windows Programs Work!
      (wineWowPackages.waylandFull.override {
        #wineRelease = "staging";
        mingwSupport = true;
      })
      winetricks # GUI Tool for Managing Wine Profiles
    ];
  };

  # Install System-Wide Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["Hack" "CascadiaMono" "SourceCodePro"];})
  ];

  environment.sessionVariables = {
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
    # Required by nh(nix-helper)
    FLAKE = "/home/sphericalpb/Documents/Miscellaneous/nix/nixRework";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    sphericalpb = {
      isNormalUser = true;
      shell = pkgs.fish;
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = ["wheel" "networkmanager"];
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
