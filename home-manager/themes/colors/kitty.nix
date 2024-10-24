{
  pkgs,
  config,
  ...
}: {
  programs = {
    kitty = {
      enable = true;
      settings = {
        # Text Color
        foreground = "#${config.colorScheme.palette.base05}";
        # Background Color
        background = "#${config.colorScheme.palette.base01}";

        # Cursor colors
        cursor = "#${config.colorscheme.palette.base05}";
        cursor_text_color = "#${config.colorscheme.palette.base00}";

        # URL underline color when hovering with mouse
        url_color = "#${config.colorscheme.palette.base0E}";

        # Kitty window border colors
        active_border_color = "#${config.colorscheme.palette.base0C}";
        inactive_border_color = "#${config.colorscheme.palette.base02}";
        bell_border_color = "#${config.colorscheme.palette.base0B}";

        # OS Window titlebar colors
        wayland_titlebar_color = "#${config.colorscheme.palette.base00}";
        macos_titlebar_color = "#${config.colorscheme.palette.base00}";

        # Tab bar colors
        active_tab_foreground = "#${config.colorScheme.palette.base00}";
        active_tab_background = "#${config.colorScheme.palette.base07}";
        inactive_tab_foreground = "#${config.colorScheme.palette.base05}";
        inactive_tab_background = "#${config.colorScheme.palette.base03}";
        tab_bar_background = "#${config.colorScheme.palette.base02}";

        # Colors for marks (marked text in the terminal)
        mark1_foreground = "#${config.colorscheme.palette.base00}";
        mark1_background = "#${config.colorscheme.palette.base07}";
        mark2_foreground = "#${config.colorscheme.palette.base00}";
        mark2_background = "#${config.colorscheme.palette.base0E}";
        mark3_foreground = "#${config.colorscheme.palette.base00}";
        mark3_background = "#${config.colorscheme.palette.base0D}";

        # Black
        color0 = "#${config.colorScheme.palette.base03}";
        color8 = "#${config.colorScheme.palette.base04}";

        # Red
        color1 = "#${config.colorScheme.palette.base08}";
        color9 = "#${config.colorScheme.palette.base08}";

        # Green
        color2 = "#${config.colorScheme.palette.base0B}";
        color10 = "#${config.colorScheme.palette.base0B}";

        # Yellow
        color3 = "#${config.colorScheme.palette.base0A}";
        color11 = "#${config.colorScheme.palette.base0A}";

        # Blue
        color4 = "#${config.colorScheme.palette.base0D}";
        color12 = "#${config.colorScheme.palette.base0D}";

        # Magenta
        color5 = "#${config.colorScheme.palette.base0E}";
        color13 = "#${config.colorScheme.palette.base0E}";

        # Cyan
        color6 = "#${config.colorScheme.palette.base0C}";
        color14 = "#${config.colorScheme.palette.base0C}";

        # White
        color7 = "#${config.colorScheme.palette.base05}";
        color15 = "#${config.colorScheme.palette.base05}";
      };
    };
  };
}
