{pkgs, ...}: {
  imports = [
    ./hypr
    ./wlogout.nix
    ./rofi
    ./wofi
    #./anyrun.nix
  ];

  home.packages = with pkgs; [
    kdePackages.xwaylandvideobridge # ScreenSharing for Electron apps like Discord on Wayland
    mako # Lightweight Wayland Notification Daemon
    swww # A Neat Wallpaper Manager for Wayland
    waypaper # GUI Wallpaper picker that supports swww, hyprpaper, etc.
    wl-clipboard # Clipboard Manager for Wayland
    wl-clip-persist # Persist Clipboard History when Closing Programs
    grim # Basic Screenshot Tool for Wayland
    slurp # Screen Region Selector for Wayland (to used with grim)
    #swappy # Image/Snapshot Editor for Wayland
    satty # Better alternative to swappy
    wlsunset # Day/Night Gamma Adjustments for Wayland
    wlogout # Logout Prompt for Wayland
  ];

  home.sessionVariables = {
    # Incase if thy cursor turns invisible on wayland
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
    # Hint Firefox to use wayland
    MOZ_ENABLE_WAYLAND = "1";
    # Hint programs/libraries to use wayland
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
}
