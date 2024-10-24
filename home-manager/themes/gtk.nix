{pkgs, ...}: {
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

  home.file."/home/sphericalpb/.icons".source = ./.icons;

  gtk = {
    enable = true;
    theme = {
      package = pkgs.magnetic-catppuccin-gtk.override {
        size = "standard";
        accent = ["green"];
        tweaks = ["macchiato"];
      };
      name = "Catppuccin-GTK-Green-Dark-Macchiato";
    };

    iconTheme = {
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "macchiato";
        accent = "yellow";
      };
      name = "Papirus";
    };

    cursorTheme = {
      name = "niko_oneshot_cursors";
    };

    font = {
      name = "SauceCodePro Nerd Font";
      size = 11;
    };
  };
}
