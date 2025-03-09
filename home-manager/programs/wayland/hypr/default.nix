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

  home.packages = with pkgs; [
    # Hyprland's own polkit agent
    #hyprpolkitagent
    # Screenshot Helper for 'grim'
    inputs.hyprland-contrib.packages.${system}.grimblast
    # xProp for Hyprland/Wayland
    inputs.hyprland-contrib.packages.${system}.hyprprop
    # Colorpicker for Hyprland
    hyprpicker
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    systemd = {
      # Disables SystemD integration, as it conflicts with UWSM
      enable = false;
      # Programs don’t work in systemd services, but do on the terminal.
      variables = ["--all"];
      # Fixes Hyprland not working after switching from other DE's/WM's
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
  };
}
