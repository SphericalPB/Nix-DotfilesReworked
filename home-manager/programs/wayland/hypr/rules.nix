{
  wayland.windowManager.hyprland = {
    settings = {
      # Window Rules
      # [https://wiki.hyprland.org/Configuring/Window-Rules]
      windowrule = [
        "float,  class:^(com.gabm.satty)$"
        "opaque, class:^(com.gabm.satty)$"
        # Pin Vivaldi Popups
        "float,  class:^(vivaldi-stable)$ title:^(Vivaldi Settings:)(.*)"
        "float,  class:^(vivaldi-stable)$ title:^(Bitwarden -)(.*)"
        "pin,    class:^(vivaldi-stable)$ title:^(Bitwarden -)(.*)"
        ## Prevent Browser from being transparent in certain webpages
        "opaque, title:(.*)(- YouTube)(.*)"
        "opaque, title:^(Meet -)(.*)"

        ## Picture-in-Picture Fix
        "tag +pip, initialtitle:^(Discord Popout)$"
        "tag +pip, title:^(Discord Popout)$"
        "tag +pip, title:^(Picture-in-Picture)$"
        "tag +pip, title:^(Picture in picture)$"

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
