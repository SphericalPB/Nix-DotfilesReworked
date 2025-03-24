{
  wayland.windowManager.hyprland = {
    settings = {
      # Window Rules
      # [https://wiki.hyprland.org/Configuring/Window-Rules]
      windowrule = [
        ## Picture-in-Picture Fix
        # Discord
        "float, initialtitle:^(Discord Popout)$"
        "pin, initialtitle:^(Discord Popout)$"
        "bordersize 0, title:^(Discord Popout)$"
        # Firefox
        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "noinitialfocus, title:^(Picture-in-Picture)$"
        "bordersize 0, title:^(Picture-in-Picture)$"
        ## Floating Browser(Firefox) Extension Window
        "float, title:^(Extension: )(.*)"
        "pin, title:^(Extension: )(.*)"
      ];
      # Workspace Rules
      # [https://wiki.hyprland.org/Configuring/Workspace-Rules]
      workspace = [
      ];
    };
  };
}
