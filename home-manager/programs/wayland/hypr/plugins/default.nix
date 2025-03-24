{...}: {
  imports = [
    # Hyprland Python Plugins (Too buggy so im replacing it with standalone programs)
    ./pyprland.nix
    # Fancy Cursor Animations
    ./hypr-dynamic-cursors.nix
    # Workspace Overview for Hyprland
    ./hyprspace.nix
  ];
}
