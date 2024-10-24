{
  inputs,
  pkgs,
  config,
  ...
}: {
  #xdg.configFile."kitty/tab_bar.py".source = ./tab_bar.py;

  programs.kitty = {
    enable = true;
    font = {
      size = 10;
      name = "Hack";
    };

    settings = {
      scrollback_lines = 10000;
      placement_strategy = "center";

      allow_remote_control = "yes";
      enable_audio_bell = "no";
      visual_bell_duration = "0.1";

      # Tab Styling
      active_tab_font_style = "normal";
      inactive_tab_font_style = "normal";
      tab_bar_style = "powerline";
      tab_bar_align = "left";
      selection_foreground = "none";
      selection_background = "none";
    };
  };
}
