{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "ph";
      kb_options = "caps:backspace,shift:both_capslock"; #"grp:alt_shift_toggle";
      follow_mouse = 2;
    };

    general = {
      gaps_in = 7;
      gaps_out = 21;
      border_size = 3;
      "col.active_border" = "rgb(${config.colorScheme.palette.base0A}) rgb(${config.colorScheme.palette.base0D}) 45deg";
      "col.inactive_border" = "rgb(${config.colorScheme.palette.base02}) rgb(${config.colorScheme.palette.base03}) 45deg";
      allow_tearing = false;
    };

    decoration = {
      rounding = 10;
      dim_inactive = true;
      dim_strength = 0.15;
      dim_special = 0;
      active_opacity = 0.97;
      inactive_opacity = 0.95;
      blur = {
        enabled = true;
        new_optimizations = true;
        size = 6;
        passes = 3;
        brightness = 1.0;
        contrast = 1.0;
        noise = 0.02;
        special = false;
      };
      drop_shadow = true;
      shadow_ignore_window = true;
      shadow_offset = "2 3";
      shadow_range = 7;
      shadow_render_power = 4;
    };

    animations = {
      enabled = true;
      animation = "workspaces, 1 ,6, default, slidevert";
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master.new_status = "master";

    misc = {
      disable_hyprland_logo = true;
      background_color = "rgb(${config.colorScheme.palette.base00})";
      disable_splash_rendering = true;
      vfr = true;
      enable_swallow = true;
      #swallow_regex = "kitty";
    };
  };
}
