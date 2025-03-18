{
  description = "Sphere's nixConfig(Rework)";

  inputs = {
    ## Nixpkgs
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    ## You can access packages and modules from different nixpkgs revs
    ## at the same time. Here's an working example:
    # nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    ## Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home-Manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # indexes available programms from the nix package manager
    # required for "comma" to work
    nix-index-database.url = "github:mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    # Install Packages in a Containerized Environment (kinda useless...)
    # Install Flatpak packages Declaratively!
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    # Ricing Made Easy!
    stylix.url = "github:danth/stylix";

    # want to theme programs to the same colorscheme dynamically?
    # use nix-colors!
    nix-colors.url = "github:misterio77/nix-colors";

    # Apple Fonts (SF Mono, my beloved <3)
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";

    # Hyprland, A Beautiful/Eye Candy Wayland Window Manager
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Official Plugin-Pack for Hyprland
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    # Dynamic Cursor Animations for Hyprland
    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland";
    };
    # Workspace Overview for Hyprland
    Hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };

    # Wayland krunner-like Runner
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Spice up your Spotify Client with themes and plugins!
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Grayjay, "Follow Creators, Not Platforms."
    grayjay = {
      type = "git";
      url = "https://codeberg.org/quasigod/nur.git";
    };

    # Zen Browser, A Beautiful Firefox Fork with ARC-like features
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    # An Anime Game Launcher (Mihoyo + WuWa)
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # Supported systems for your flake packages, shell, etc.
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    # Your custom packages
    # Accessible through 'nix build', 'nix shell', etc
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};
    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules/nixos;
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./modules/home-manager;

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      Spherical-Nix = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          # > Our main nixos configuration file <
          ./nixos/configuration.nix
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      "sphericalpb@Spherical-Nix" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          # > Our main home-manager configuration file <
          ./home-manager/home.nix
        ];
      };
    };
  };
}
