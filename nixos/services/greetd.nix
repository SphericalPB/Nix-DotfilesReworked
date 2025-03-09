{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  # Using GreetD instead for better Wayland support!
  services.greetd = {
    enable = true;
    restart = false;
    settings = {
      #default_session = {
      #command = "cage -s -mlast -- ${config.programs.regreet.package}";
      #user = "greeter";
      #command = "${lib.getExe config.programs.hyprland.package}";
      #user = "greeter";
      #};
      #initial_session = {
      #  command = "${lib.getExe config.programs.hyprland.package} --config /etc/greetd/hyprland.conf";
      #  user = "greeter";
      #};
    };
  };
  environment.etc."greetd/hyprland.conf".text = ''
    exec-once = regreet; hyprctl dispatch exit
    misc {
      disable_hyprland_logo = true
      disable_splash_rendering = true
      disable_hyprland_qtutils_check = true
    }
  '';
  # A clean and customizable GTK-based greetd greeter
  programs.regreet = {
    enable = true;
    #theme = {
    #  package = pkgs.catppuccin-gtk.override {
    #    size = "standard";
    #    accents = ["blue"];
    #    variant = "macchiato";
    #    #tweaks = [ "" ];
    #  };
    #  #name = "Catppuccin-GTK-Green-Dark-Macchiato";
    #  name = "catppuccin-macchiato-blue-standard";
    #};
    #font = {
    #  package = inputs.apple-fonts.packages.${pkgs.system}.sf-mono-nerd;
    #  name = "SFMono Nerd Font";
    #  size = 11;
    #};
  };
}
