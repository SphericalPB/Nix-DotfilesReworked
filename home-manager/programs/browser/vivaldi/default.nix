{pkgs, ...}: let
  vivaldi = pkgs.vivaldi.overrideAttrs (old: {
    installPhase = ''
      ${old.installPhase}
      cp -vf "${./resources}"/* "$out/opt/vivaldi/resources/vivaldi/"
    '';
  });
in {
  home.packages = with pkgs; [
    master.vivaldi
  ];

  xdg.configFile."vivaldi/chrome".source = ./chrome;
}
