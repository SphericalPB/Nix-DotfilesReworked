{pkgs, ...}: let
  #catppuccin-fish = pkgs.fetchFromGitHub {
  #  owner = "catppuccin";
  #  repo = "fish";
  #  rev = "0ce27b518e8ead555dec34dd8be3df5bd75cff8e";
  #  hash = "sha256-Dc/zdxfzAUM5NX8PxzfljRbYvO9f9syuLO8yBr+R3qg=";
  #};
  scripts = "~/.config/nixConf/home-manager/terminal/shell/scripts";
  #nixDir = "~/.config/nixConf";
  #nixHost = "Spherical-Nix";
  #nixUser = "sphericalpb";
in {
  imports = [
    #./tide.nix
  ];

  # Appling Fish Plugin Themes
  #xdg.configFile."fish/themes/Catppuccin Macchiato.theme".source = "${catppuccin-fish}/themes/Catppuccin Macchiato.theme";

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disables Intro Text
      fish_vi_key_bindings # Enables Vi-like Shortcuts
    '';

    # Will Execute if Fish is Login/Default Shell
    #shellInit = ''
    #'';

    shellAliases = {
      #rebuild-switch = "pushd ${nixDir}; alejandra .; git add .; nh os switch -H ${nixHost}; popd";
      #home-switch = "pushd ${nixDir}; alejandra .; git add .; nh home switch -c ${nixUser}@${nixHost}; popd";
      #nix-commit = ''pushd ${nixDir}; read Name -p 'echo "Commit Name?"; echo "> "'; git commit -am $NAME; git push; popd'';
      rebuild-switch = "${scripts}/rebuild-switch.sh";
      home-switch = "${scripts}/rebuild-switch.sh -H";
      ls = "lsd";
      cat = "bat";
      rm = "trash";
      rl = "trash-list";
    };

    plugins = [
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
