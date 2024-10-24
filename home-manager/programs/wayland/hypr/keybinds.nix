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
      "$alt" = "ALT";
      "$ctrl" = "CTRL";
      "$shift" = "SHIFT";

      bind =
        [
          "$mod, Q, killactive,"
          "$mod, C, togglefloating,"
          "$mod, S, togglesplit,"
          "$mod, F, fullscreen, 0"
          "$modAlt, F, fullscreen, 2"

          "$modAlt, N, movefocus, l"
          "$modAlt, E, movefocus, d"
          "$modAlt, I, movefocus, u"
          "$modAlt, O, movefocus, r"

          "$mod, E, workspace, +1"
          "$mod, I, workspace, -1"
          "$modAlt, E, movetoworkspace, +1"
          "$modAlt, I, movetoworkspace, -1"
          "$mod, mouse_up, workspace, e+1"
          "$mod, mouse_down, workspace, e-1"

          # Utilities
          "$modShift, Q, exec, wlogout"
          "$mod, Return, exec, $TERM"
          "$modShift, F, exec, $BROWSER"
          "$modShift, E, exec, nemo"
          "$alt, Space, exec, rofi -show drun"
          "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
          "$mod, P, exec, notify-send $(hyprpicker --autocopy)"

          # Screenshot
          # Fullscreen Screenshot
          ", Print, exec, grimblast --notify --cursor copysave output $shotDir"

          # Select Area Screenshot
          # stop animations while screenshotting; makes black border go away --fufexan
          "$ctrl, Print, exec, ${screenshotarea}"

          # Annotate Select Area
          "$mod, Print, exec, grimblast save area - | swappy -f -"
        ]
        ++ workspaces;

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

      bindle = [
        # Volume Controls
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"
      ];
    };

    extraConfig = ''
      # Gromit-MPX Fix (https://www.reddit.com/r/hyprland/comments/18kutkk)
      bind = SHIFT CTRL, G, togglespecialworkspace, gromit
      bind = , F8, exec, gromit-mpx --undo
      bind = SHIFT, F8, exec, gromit-mpx --redo
      bind = SHIFT, F9, exec, gromit-mpx --clear
    '';
  };
}
