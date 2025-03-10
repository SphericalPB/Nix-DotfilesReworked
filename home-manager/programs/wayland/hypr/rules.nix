{
  wayland.windowManager.hyprland = {
    settings = {
      # Window Rules
      # [https://wiki.hyprland.org/Configuring/Window-Rules]
      windowrulev2 = [
        # Discord Picture-in-Picture
        "float, initialtitle:^(Discord Popout)$, class:^(vesktop)$"
        "pin, initialtitle:^(Discord Popout)$, class:^(vesktop)$"
        # Zen-Firefox Picture-in-Picture
        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "decorate off, title:^(Picture-in-Picture)$"
        "noinitialfocus, title:^(Picture-in-Picture)$"
      ];
      # Workspace Rules
      # [https://wiki.hyprland.org/Configuring/Workspace-Rules]
      workspace = [
      ];
    };
    extraConfig = ''
      # Gromit-MPX Fix
      # [https://www.reddit.com/r/hyprland/comments/18kutkk]
      workspace = special:gromit, gapsin:0, gapsout:0, on-created-empty: gromit-mpx -a
      windowrule = noblur, ^(Gromit-mpx)$
      windowrule = opacity 1 override, 1 override, ^(Gromit-mpx)$
      windowrule = noshadow, ^(Gromit-mpx)$
      windowrule = suppressevent, fullscreen, ^(Gromit-mpx)$
      windowrule = size 100% 100%, ^(Gromit-mpx)$
      #xwaylandvideobridge
      windowrulev2 = opacity 0.0 override, class:^(xwaylandvideobridge)$
      windowrulev2 = noanim, class:^(xwaylandvideobridge)$
      windowrulev2 = noinitialfocus, class:^(xwaylandvideobridge)$
      windowrulev2 = maxsize 1 1, class:^(xwaylandvideobridge)$
      windowrulev2 = noblur, class:^(xwaylandvideobridge)$
      windowrulev2 = nofocus, class:^(xwaylandvideobridge)$
    '';
  };
}
