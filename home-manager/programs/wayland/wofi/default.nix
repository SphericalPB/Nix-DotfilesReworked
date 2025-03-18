{...}: {
  imports = [
    ./settings.nix
    #./style.nix
  ];
  programs.wofi = {
    enable = true;
  };
}
