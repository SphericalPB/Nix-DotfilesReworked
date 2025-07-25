{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.stylix.homeModules.stylix];
  stylix = {
    enable = true;
    # Global Colorscheme
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    polarity = "dark";
    # Default wallpaper
    #image = ./wallpaper.png;
    # Setting Global Fonts
    fonts = {
      serif = {
        package = pkgs.comfortaa;
        name = "Comfortaa";
      };
      sansSerif = {
        package = pkgs.comfortaa;
        name = "Comfortaa";
      };
      monospace = {
        package = pkgs.nerd-fonts.inconsolata;
        name = "Inconsolata Nerd Font";
      };
      sizes = {
        applications = 12;
        terminal = 13;
      };
    };

    cursor = {
      package = pkgs.oreo-cursors-plus.override {
        # Name = Colour LabelColour ShadowColour ShadowOpacity
        cursorsConf = "catppuccin-macchiato = #b7bdf8";
      };
      name = "oreo_catppuccin-macchiato_cursors";
      size = 32;
    };
    targets = {
      hyprland.enable = false;
      kde.enable = false;
      vscode.enable = false;
      spicetify.enable = false;
      #fish.enable = false;
    };
  };
}
