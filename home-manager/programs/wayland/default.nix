{pkgs, ...}: {
  imports = [
    ./hypr
  ];

  home.packages = with pkgs; [
    swww # A Neat Wallpaper Manager for Wayland
    wl-clipboard # Clipboard Manager for Wayland
    wl-clip-persist # Persist Clipboard History when Closing Programs
    grim # Basic Screenshot Tool for Wayland
    slurp # Screen Region Selector for Wayland (to used with grim)
    swappy # Image/Snapshot Editor for Wayland
    wlsunset # Day/Night Gamma Adjustments for Wayland
    rofi-wayland # A Customizable App Launcher (with Wayland Support)
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