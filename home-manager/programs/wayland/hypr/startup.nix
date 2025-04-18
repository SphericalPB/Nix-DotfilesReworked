{
  wayland.windowManager.hyprland = {
    settings = {
      env = [
        "HYPRLAND_SCRATCHPAD_NAME,backdoor"
        #"HYPRCURSOR_THEME,niko_oneshot_hyprcursors"
        #"HYPRCURSOR_SIZE,24"
      ];
      exec-once = [
        # Super User Password Prompt for GUI Applications
        #"systemctl --user enable --now hyprpolkitagent.service"
        "uwsm app -- swww-daemon"
        #"uwsm app -- hdrop -b"
        "uwsm app -- wlsunset -l 13 -L 122"
        # Clipboard
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "wl-clip-persist --clipboard regular"
      ];
      exec = [
        "hyprctl setcursor 'oreo_catppuccin-macchiato_cursors' 32"
      ];
    };
  };
}
