{...}:
#tuigreet = "${config.programs.regreet.package}/bin/regreet";
#hyprland = "${pkgs.hyprland}/share/wayland-sessions";
{
  services.greetd = {
    enable = true;
  };

  programs.regreet = {
    enable = true;
    settings = {
      background = "/home/sphericalpb/Pictures/Wallpapers/aqua-japan.jpg";
    };
  };

  services.xserver = {
    displayManager.startx.enable = true;
  };
}
