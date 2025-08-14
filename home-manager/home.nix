# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    ./themes
    ./services
    ./programs
    ./terminal
  ];

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
    };
  };

  home = {
    username = "sphericalpb";
    homeDirectory = "/home/sphericalpb";
    sessionVariables = {
      EDITOR = "lvim";
      TERMINAL = "kitty";
      BROWSER = "vivaldi";
    };
  };
  # Hint Programs to Follow 'xdg-user-dirs' Configured Directories
  xdg.userDirs.enable = true;
  # Setting Default Applications through XDG Mime(self-explanatory LMAO)
  #xdg.mimeApps = {
  #  enable = true; # Dont Forget! c:
  #  defaultApplications = {
  #    #"mimetype1" = [ "default1.desktop" "default2.desktop" ];
  #    "inode/directory" = "nemo.desktop"; # File Manager
  #    "image/png" = "qimgv.desktop";
  #    "image/jpeg" = "qimgv.desktop";
  #  };
  #};

  # Set Base16 Colorscheme
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;

  # List of Installed Programs [Per-User]
  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "SphericalPB";
      userEmail = "xdmaxgamer360@gmail.com";
    };
  };
  home.packages = with pkgs; [
    nemo-with-extensions # Preferred File-Manager
    file-roller
    qimgv # Image Viewer
    pavucontrol # Audio-Mixer
    vlc # Best Video Player
    obs-studio # A widely used Free n' Open-Source Program for Screen Recording/Streaming
    krita # Open-Source Art Program
    libreoffice-fresh # FOSS Office Suite
    #jetbrains.idea-community-bin # Java IDE required for College
    obsidian # Markdown Text Editor
    #logseq  # A Neat Obsidian Alternative
    anki # Spaced Repetition Flashcard Program
    #inputs.zen-browser.packages."${system}".default # A Beautiful Arc-like Firefox Fork
    #vivaldi # Another feature-rich browser with a focus on vertical tabs
    #vesktop # Discord... but BETTER!! Note: Screenshare's not working for some reason...
    legcord # Using the legcord client instead.
    #master.grayjay # Grayjay ( Follow Creators, Not Platforms )
    bottles # Bottles! An Easy-to-Use Wine-Prefix Manager
    protonup # GUI Proton Manager
    mangohud # System-Performance Stats for Games
    umu-launcher
    #suyu # A Community Recontiuation of YUZU(Nintendo Switch) Emulator (got taken down for potential DMCA :[ )
    prismlauncher # Popular Open-Source Minecraft Launcher
    gale # Thunderstore Mod-Launcher for numerous games
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
