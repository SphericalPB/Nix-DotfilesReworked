{
  inputs,
  pkgs,
  ...
}: {
  #imports = [inputs.zen-nebula.homeModules.default];
  # no declarative customizations :[
  #zen-nebula = {
  #  enable = true;
  #  profile = "Disco-Cat";
  #};

  home.packages = [
    inputs.zen-browser.packages."${pkgs.system}".default
  ];
}
