let
  screenshotarea = "hyprctl keyword animation 'fadeOut,0,0,default'; grimblast --notify --freeze copysave area $shotDir; hyprctl keyword animation 'fadeOut,1,4,default'";

  # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
  workspaces = builtins.concatLists (builtins.genList (
      x: let
        ws = let
          c = (x + 1) / 10;
        in
          builtins.toString (x + 1 - (c * 10));
      in [
        "$mod, ${ws}, workspace, ${toString (x + 1)}"
        "$modShift, ${ws}, movetoworkspace, ${toString (x + 1)}"
      ]
    )
    10);
in {
  wayland.windowManager.hyprland = {
    settings = {
      "$shotDir" = "~/Pictures/Screenshots/Desktop/$(date -u +%F_%H%M%S).png";

      "$mod" = "SUPER";
      "$modShift" = "SHIFT_SUPER";
      "$modAlt" = "ALT SUPER";
      "$modAltShift" = "ALT SHIFT SUPER";
      "$alt" = "ALT";
      "$ctrl" = "CTRL";
      "$shift" = "SHIFT";

      bind =
        [
          # Window Manipulation
          "$mod, Q, killactive,"
          "$mod, C, togglefloating,"
          "$mod, S, togglesplit,"
          "$mod, F, fullscreen, 0"
          "$modAlt, F, fullscreen, 1"

          # Window Management
          "$modAlt, H, movefocus, l"
          "$modAlt, J, movefocus, d"
          "$modAlt, K, movefocus, u"
          "$modAlt, L, movefocus, r"
          "$modAltShift, H, swapwindow, l"
          "$modAltShift, J, swapwindow, d"
          "$modAltShift, K, swapwindow, u"
          "$modAltShift, L, swapwindow, r"

          # Manage Workspaces
          "$mod, J, workspace, +1"
          "$mod, K, workspace, -1"
          "$modShift, J, movetoworkspace, +1"
          "$modShift, K, movetoworkspace, -1"
          "$mod, mouse_up, workspace, e+1"
          "$mod, mouse_down, workspace, e-1"

          ## Utilities
          "$modShift, Q, exec, uwsm app -- sh $HOME/.config/rofi/bin/powermenu"
          # Terminal
          "$mod, Return, exec, uwsm app -- kitty"
          # Browser
          "$modShift, F, exec, uwsm app -- zen"
          # File-Manager
          "$modShift, E, exec, uwsm app -- nemo"
          # Application Launcher
          "$alt, Space, exec, uwsm app -- sh $HOME/.config/rofi/bin/launcher"
          # Clipboard Menu
          "$mod, V, exec, cliphist list | uwsm app -- rofi -dmenu | cliphist decode | wl-copy"
          # Colorpicker
          "$mod, P, exec, notify-send $(uwsm app -- hyprpicker --autocopy)"

          # Screenshot
          # Fullscreen Screenshot
          ", Print, exec, uwsm app -- grimblast --notify --cursor copysave output $shotDir"

          # Select Area Screenshot
          # stop animations while screenshotting; makes black border go away -fufexan
          "$ctrl, Print, exec, uwsm app -- ${screenshotarea}"

          # Annotate Select Area
          "$mod, Print, exec, uwsm app -- grimblast save area - | uwsm app -- swappy -f -"
        ]
        ++ workspaces;

      # Binds that rely on mouse movement
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindl = [
        # Media Controls
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      bindel = [
        # Volume Controls
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"
      ];
    };

    #extraConfig = ''
    #  # Gromit-MPX Fix (https://www.reddit.com/r/hyprland/comments/18kutkk)
    #  bind = SHIFT CTRL, G, togglespecialworkspace, gromit
    #  bind = , F8, exec, gromit-mpx --undo
    #  bind = SHIFT, F8, exec, gromit-mpx --redo
    #  bind = SHIFT, F9, exec, gromit-mpx --clear
    #'';
  };
}
