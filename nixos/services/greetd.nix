{...}:
#tuigreet = "${config.programs.regreet.package}/bin/regreet";
#hyprland = "${pkgs.hyprland}/share/wayland-sessions";
{
  services.greetd = {
    enable = true;
    #settings = {
    #default_session = {
    #  command = "${tuigreet} --time --remember --remember-session ${hyprland}";
    #  user = "greeter";
    #};
    #};
  };

  programs.regreet.enable = true;

  #systemd.services.greetd.serviceConfig = {
  #  Type = "idle";
  #  StandardInput = "tty";
  #  StandardOutput = "tty";
  #  StandardError = "journal";
  #  TTYReset = true;
  #  TTYVHangup = true;
  #  TTYTDisallocate = true;
  #};

  services.xserver = {
    displayManager.startx.enable = true;
  };
}
