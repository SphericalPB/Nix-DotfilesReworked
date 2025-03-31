{
  wayland.windowManager.hyprland = {
    settings = {
      # Window Rules
      # [https://wiki.hyprland.org/Configuring/Window-Rules]
      windowrule = [
        ## Prevent Browser from being transparent in certain webpages
        "opaque, title:(.*)(- YouTube)(.*)"
        ## Picture-in-Picture Fix
        "tag +pip, initialtitle:^(Discord Popout)$"
        "tag +pip, title:^(Discord Popout)$"
        "tag +pip, title:^(Picture-in-Picture)$"

        "float, tag:pip*"
        "pin, tag:pip*"
        "noborder, tag:pip*"
        "opaque, tag:pip*"
      ];
      # Workspace Rules
      # [https://wiki.hyprland.org/Configuring/Workspace-Rules]
      workspace = [
      ];
    };
  };
}
