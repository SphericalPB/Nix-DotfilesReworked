{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors];
    settings.plugin.dynamic-cursors = {
      enabled = true;
      shake.enabled = false;
      mode = "tilt";
      shaperule = [
        #"grab, rotate, rotate:length:20"
        "grab, stretch, stretch:limit: 1500"
      ];
    };
  };
}
