{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    dconf
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  gtk = {
    enable = true;
    theme = {
      #package = pkgs.magnetic-catppuccin-gtk.override {
      #  size = "standard";
      #  accent = ["green"];
      #  tweaks = ["macchiato"];
      #};
      package = pkgs.catppuccin-gtk.override {
        size = "standard";
        accents = ["blue"];
        variant = "macchiato";
        #tweaks = [ "" ];
      };
      #name = "Catppuccin-GTK-Green-Dark-Macchiato";
      name = "catppuccin-macchiato-blue-standard";
    };

    iconTheme = {
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "macchiato";
        accent = "lavender";
      };
      name = "Numix";
    };

    cursorTheme = {
      name = "niko_oneshot_cursors";
    };

    font = {
      package = inputs.apple-fonts.packages.${pkgs.system}.sf-mono-nerd;
      name = "SFMono Nerd Font";
      size = 11;
    };
  };
}
