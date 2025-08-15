# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: let
  pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # Nix-Index-Database
    inputs.nix-index-database.nixosModules.nix-index

    # An-Anime-Game-Launcher (Mihoyo & WuWa)
    inputs.aagl.nixosModules.default

    # You can also split up your configuration and import pieces of it here:
    ./services

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  # Automatically updates system packages weekly
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.very-unstable-packages
      outputs.overlays.stable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      allowUnfreePredicate = _: true;
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
      # Automatically hard-links similar packages in /nix/store
      auto-optimise-store = true;
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
      # Cachix (A Simple way to avoid building large programs)
      substituters = [
        "https://hyprland.cachix.org"
        "https://ezkea.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      ];
    };

    # Nix Store Garbage Collection (replaced in favor for nix-helper's gc implementation: https://github.com/nix-community/nh)
    #gc = {
    #  automatic = true;
    #  dates = "daily";
    #  options = "--delete-older-than 10d";
    #};

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
      # Trusted Sources
      allowedTCPPorts = [
        53317
        8384 #Local Send
        22000 # Syncthing
        45879 # Grayjay
        34125
      ];
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
      #extraPackages = [pkgs.mesa pkgs.amdvlk];
      #extraPackages32 = [pkgs.driversi686Linux.mesa pkgs.driversi686Linux.amdvlk];
      # For graphics version compatibility with Hyprland
      extraPackages = [pkgs-unstable.mesa pkgs.amdvlk];
      extraPackages32 = [pkgs-unstable.driversi686Linux.mesa pkgs.driversi686Linux.amdvlk];
    };
    # Setup Drawing Tablet with OpenTabletDriver
    opentabletdriver.enable = true;
  };

  services = {
    # Xorg/X11
    xserver = {
      enable = true;
      videoDrivers = ["amdgpu"];
      desktopManager = {
        xterm.enable = false;
        #xfce.enable = true;
        #noDesktop = true;
        #enableXfwm = false;
      };
      # windowManager.awesome = {
      #   enable = true;
      #   luaModules = with pkgs.luaPackages; [
      #     luarocks
      #     luadbi-mysql
      #   ];
      # };
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
    # Nix cli helper: https://github.com/nix-community/nh
    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 4d --keep 3";
      };
      flake = "/home/sphericalpb/.config/nixConf";
    };

    fish.enable = true;
    # Wrap and Install Comma
    # Run packages Without Installing or Running 'nix-shell'
    nix-index-database.comma.enable = true;
    # Universal Wayland Session Manager (UWSM)
    # Wraps standalone Wayland compositors into a set of Systemd units on the fly.
    uwsm.enable = true;
    # Globally Installs Hyprland
    hyprland = {
      enable = true;
      # Generates a new desktop entry(hyprland-uwsm.desktop), which will be available in display managers
      # and Universal Wayland Session Manager (UWSM)
      withUWSM = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };
    # Run unpatched dynamic binaries on NixOS.
    nix-ld.enable = true;
    # Steam
    steam = {
      enable = true;
      extraPackages = with pkgs; [glxinfo gperftools];
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    # Zenless Zone Zero for NixOS/Linux
    sleepy-launcher = {
      enable = true;
      package = inputs.aagl.packages.x86_64-linux.sleepy-launcher;
    };
    gamemode.enable = true;
  };

  # List of installed packages
  environment = {
    systemPackages = with pkgs; [
      # Nix related packages
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
      superfile # File-Manager
      neovim # Preferred text editor
      master.lunarvim # IDE-like configuration/layer for Neovim
      git # Manage Projects/Dotfiles With Git!
      temurin-jre-bin # Java Runtime
      xdg-user-dirs # Automatically Create or Modify User Folders
      # Better CLI alternatives
      lsd # Better 'ls'
      fd # Better 'find'
      btop # Better 'htop'/Terminal Task-Manager
      ripgrep # Better 'grep'
      bat # Better 'cat'
      delta # Better 'git diff' pager, based on 'bat'
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
    nerd-fonts.hack
    nerd-fonts.caskaydia-mono
    nerd-fonts.sauce-code-pro
    # Some Microsoft Fonts
    corefonts
    vistafonts
  ];

  environment.sessionVariables = {
    #GDK_BACKEND = "wayland, x11";
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
