{pkgs, ...}: let
  catppuccin-fish = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "fish";
    rev = "0ce27b518e8ead555dec34dd8be3df5bd75cff8e";
    hash = "sha256-Dc/zdxfzAUM5NX8PxzfljRbYvO9f9syuLO8yBr+R3qg=";
  };

  nixDir = "~/Documents/Miscellaneous/nix/nixRework"; #"~/.config/nixconf";
  nixHost = "Spherical-Nix";
  nixUser = "sphericalpb";
in {
  # Appling Fish Plugin Themes
  xdg.configFile."fish/themes/Catppuccin Macchiato.theme".source = "${catppuccin-fish}/themes/Catppuccin Macchiato.theme";

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disables Intro Text
      fish_vi_key_bindings # Enables Vi-like Shortcuts
    '';

    # Will Execute if Fish is Login/Default Shell
    shellInit = ''
      # Exports
      set -x TERM kitty
      set -x EDITOR nvim
      set -x BROWSER zen
    '';

    shellAliases = {
      rebuild-switch = "pushd ${nixDir}; alejandra .; git add .; nh os switch -H ${nixHost}; popd";
      home-switch = "pushd ${nixDir}; alejandra .; git add .; nh home switch -c ${nixUser}@${nixHost}; popd";
      nix-commit = ''pushd ${nixDir}; read Name -p 'echo "Commit Name?"; echo "> "'; git commit -am $NAME; git push; popd'';
      ls = "lsd";
      cat = "bat";
      rm = "trash";
      rl = "trash-list";
    };

    plugins = [
      {
        # Theming CMD Prompts
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
      {
        # For Tidying Up Fish's Command History
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }
      {
        # Text Expansions for Fish
        name = "puffer";
        src = pkgs.fishPlugins.puffer.src;
      }
      {
        # Auto Complete Pairing Symbols
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        # Mock Commands on Fish (mock)
        name = "clownfish";
        src = pkgs.fishPlugins.clownfish.src;
      }
      {
        # Notify When Done
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
    ];
  };
}
