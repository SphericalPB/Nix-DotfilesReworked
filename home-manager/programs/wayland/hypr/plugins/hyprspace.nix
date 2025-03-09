{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [inputs.Hyprspace.packages.${pkgs.system}.Hyprspace];
    settings = {
      bind = [
        "$mod, Tab, overview:toggle"
      ];
      #plugin. = [];
    };
  };
}
