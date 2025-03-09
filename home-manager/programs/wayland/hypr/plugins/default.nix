{...}: {
  imports = [
    # Hyprland Python Plugins
    ./pyprland.nix
    # Fancy Cursor Animations
    ./hypr-dynamic-cursors.nix
    # Workspace Overview for Hyprland
    ./hyprspace.nix # Currently doesn't work on Hyprland 0.47.x
    # Temporary a replacement for Hyprspace
    #./hyprexpo.nix
  ];
}
