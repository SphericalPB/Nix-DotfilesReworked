{
  pkgs,
  config,
  ...
}: {
  xdg.configFile."lf/icons".source = ./icons;

  programs.lf = {
    enable = true;
    settings = {
      icons = true;
      drawbox = true;
      preview = true;
    };

    commands = {
      dragon-out = ''%xdragon -a -x "$fx"''; # dragon for drag n' drop on the terminal
      editor-open = ''$$EDITOR $f'';
      mkdir = ''
        ''${{
          printf "Directory Name: "
          read DIR
          mkdir $DIR
        }}
      '';
      toggle-preview = ''        %{{
            if [ "$lf_preview" = "true" ]; then
                lf -remote "send $id :set preview false; set ratios 1:5"
            else
                lf -remote "send $id :set preview true; set ratios 1:2:3"
            fi
        }}'';
      setwallpaper = ''
            ''${{
               swww img --transition-type grow --transition-step 120 --transition-pos "$(hyprctl cursorpos)" --invert-y "$f"
        ln -sf "$f" ~/.config/nix-conf/home-manager/applications/hypr/background.png
               }}
      '';
    };

    keybindings = {
      "\\\"" = "";
      o = "";
      "." = "set hidden!";
      "`" = "mark-load";
      "\\'" = "mark-load";
      "<enter>" = "open";

      do = "dragon-out";
      ee = "editor-open";
      md = "mkdir";
      zp = "toggle-preview";
      st = "setwallpaper";
    };

    # The fuck is this mess down here???
    previewer = {
      keybinding = "p";
      source = let
        previewer = pkgs.writeShellScriptBin "pv.sh" ''
          file=$1
          w=$2
          h=$3
          x=$4
          y=$5

          if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
              ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
              exit 1
          fi

          ${pkgs.pistol}/bin/pistol "$file"
        '';
      in ''${previewer}/bin/pv.sh'';
    };

    extraConfig = let
      cleaner = pkgs.writeShellScriptBin "clean.sh" ''
        #!/usr/bin/env bash
               ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
      '';
    in ''
      set cleaner ${cleaner}/bin/clean.sh
    '';
  };
}
