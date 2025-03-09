{pkgs, ...}: {
  programs.fish = {
    plugins = [
      {
        # Theming CMD Prompts
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
    ];
    # Tide Configuration
    shellInit = ''
      #tide configure --auto --style=Classic --prompt_colors='16 colors' --show_time=No --classic_prompt_separators=Slanted --powerline_prompt_heads=Sharp --powerline_prompt_tails=Sharp --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Dotted --powerline_right_prompt_frame=Yes --prompt_spacing=Sparse --icons='Many icons' --transient=No
    '';
  };
}
