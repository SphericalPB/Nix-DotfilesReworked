{config, ...}: {
  programs.kitty.settings = {
    # Text Color
    foreground = "#${config.lib.stylix.colors.base05}";
    # Background Color
    background = "#${config.lib.stylix.colors.base01}";

    # Cursor colors
    cursor = "#${config.lib.stylix.colors.base05}";
    cursor_text_color = "#${config.lib.stylix.colors.base00}";

    # URL underline color when hovering with mouse
    url_color = "#${config.lib.stylix.colors.base0E}";

    # Kitty window border colors
    active_border_color = "#${config.lib.stylix.colors.base0C}";
    inactive_border_color = "#${config.lib.stylix.colors.base02}";
    bell_border_color = "#${config.lib.stylix.colors.base0B}";

    # OS Window titlebar colors
    wayland_titlebar_color = "#${config.lib.stylix.colors.base00}";
    macos_titlebar_color = "#${config.lib.stylix.colors.base00}";

    # Tab bar colors
    active_tab_foreground = "#${config.lib.stylix.colors.base00}";
    active_tab_background = "#${config.lib.stylix.colors.base07}";
    inactive_tab_foreground = "#${config.lib.stylix.colors.base05}";
    inactive_tab_background = "#${config.lib.stylix.colors.base03}";
    tab_bar_background = "#${config.lib.stylix.colors.base02}";

    # Colors for marks (marked text in the terminal)
    mark1_foreground = "#${config.lib.stylix.colors.base00}";
    mark1_background = "#${config.lib.stylix.colors.base07}";
    mark2_foreground = "#${config.lib.stylix.colors.base00}";
    mark2_background = "#${config.lib.stylix.colors.base0E}";
    mark3_foreground = "#${config.lib.stylix.colors.base00}";
    mark3_background = "#${config.lib.stylix.colors.base0D}";

    # Black
    color0 = "#${config.lib.stylix.colors.base03}";
    color8 = "#${config.lib.stylix.colors.base04}";

    # Red
    color1 = "#${config.lib.stylix.colors.base08}";
    color9 = "#${config.lib.stylix.colors.base08}";

    # Green
    color2 = "#${config.lib.stylix.colors.base0B}";
    color10 = "#${config.lib.stylix.colors.base0B}";

    # Yellow
    color3 = "#${config.lib.stylix.colors.base0A}";
    color11 = "#${config.lib.stylix.colors.base0A}";

    # Blue
    color4 = "#${config.lib.stylix.colors.base0D}";
    color12 = "#${config.lib.stylix.colors.base0D}";

    # Magenta
    color5 = "#${config.lib.stylix.colors.base0E}";
    color13 = "#${config.lib.stylix.colors.base0E}";

    # Cyan
    color6 = "#${config.lib.stylix.colors.base0C}";
    color14 = "#${config.lib.stylix.colors.base0C}";

    # White
    color7 = "#${config.lib.stylix.colors.base05}";
    color15 = "#${config.lib.stylix.colors.base05}";
  };
}
