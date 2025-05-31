{pkgs, ...}: let
  vivaldi = pkgs.vivaldi.overrideAttrs (old: {
    installPhase = ''
      ${old.installPhase}
      cp -vf "${./resources}"/* "$out/opt/vivaldi/resources/vivaldi/"
    '';
  });
in {
  home.packages = with pkgs; [
    vivaldi
  ];
}
