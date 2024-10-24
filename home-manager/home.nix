# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
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
      outputs.overlays.unstable-packages

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
  };

  # Hint Programs to Follow 'xdg-user-dirs' Configured Directories
  xdg.userDirs.enable = true;

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
    qimgv    # Image Viewer
    vlc      # Best Video Player
    krita    # Open-Source Art Program
    libreoffice-fresh # FOSS Office Suite
    obsidian # Markdown Text Editor
    #logseq  # A Neat Obsidian Alternative
    anki     # Spaced Repetition Flashcard Program
    vesktop  # Discord... but BETTER!!
    inputs.zen-browser.packages."${system}".generic # A Beautiful ARC-like Firefox Fork
    bottles  # Bottles! An Easy-to-Use Wine-Prefix Manager
    protonup # GUI Proton Manager
    mangohud # System-Performance Stats for Games
    # Installs Vivaldi with proprietary video codecs
    (vivaldi.override {
      proprietaryCodecs = true;
      enableWidevine = false;
    })
    vivaldi-ffmpeg-codecs
    widevine-cdm
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
