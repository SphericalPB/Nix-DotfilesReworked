{
  lib,
  config,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.getExe config.programs.hyprland.package} --config /etc/greetd/hyprland.conf";
        user = "greeter";
      };
    };
  };

  # Hyprland configuration, to be used by greetd using hyprland as its compositor
  environment.etc."greetd/hyprland.conf".text = ''
    exec-once = regreet; hyprctl dispatch exit
    misc {
      disable_hyprland_logo = true
      disable_splash_rendering = true
      disable_hyprland_qtutils_check = true
    }
  '';

  programs.regreet = {
    enable = true;
  };
}
