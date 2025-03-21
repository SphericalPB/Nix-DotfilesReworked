{
  wayland.windowManager.hyprland = {
    settings = {
      # Window Rules
      # [https://wiki.hyprland.org/Configuring/Window-Rules]
      windowrule = [
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
  };
}
