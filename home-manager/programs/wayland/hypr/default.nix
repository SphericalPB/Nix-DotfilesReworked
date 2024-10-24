{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./startup.nix
    ./settings.nix
    ./keybinds.nix
    ./rules.nix
    ./plugins
  ];

  home.packages = [
    # Screenshot Helper for 'grim'
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    # xProp for Wayland
    inputs.hyprland-contrib.packages.${pkgs.system}.hyprprop
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    # Fixes Hyprland not working after switching from other DE's/WM's
    systemd = {
      variables = ["--all"];
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
  };
}
