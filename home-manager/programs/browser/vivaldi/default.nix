{pkgs, ...}: let
  vivaldi = pkgs.master.vivaldi.overrideAttrs (old: {
    installPhase = ''
      ${old.installPhase}
      cp -vf "${./resources}"/* "$out/opt/vivaldi/resources/vivaldi/"
    '';
  });
in {
  home.packages = with pkgs; [
    vivaldi
  ];

  xdg.configFile."vivaldi/chrome".source = ./chrome;
}
