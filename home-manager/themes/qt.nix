{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    qt6Packages.qtstyleplugin-kvantum
    qt6Packages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct

    (catppuccin-kvantum.override {
      accent = "Mauve";
      variant = "Macchiato";
    })
  ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  #xdg.configFile = {
  #  "Kvantum" = {
  #    source = "${}"
  #  };
  #};
}
