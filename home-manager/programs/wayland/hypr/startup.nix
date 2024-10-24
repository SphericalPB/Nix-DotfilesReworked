{
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "swww-daemon"
        "wlsunset -l 13 -L 122"
        # Clipboard
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "wl-clip-persist --clipboad regular"
      ];
      exec = [
        "hyprctl setcursor 'niko_oneshot_cursors' 24"
      ];
    };
  };
}
