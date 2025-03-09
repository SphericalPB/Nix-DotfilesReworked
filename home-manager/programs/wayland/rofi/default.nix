{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    rofi-wayland # A Customizable App Launcher (with Wayland Support)
  ];

  xdg.configFile = {
    "rofi/config".source = ./config;
    "rofi/bin".source = ./bin;
  };
}
