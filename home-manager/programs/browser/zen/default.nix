{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.twilight
    ./theme.nix
  ];

  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [pkgs.firefoxpwa];
    profiles.Funky-Rodent = {
      #name = "Funky-Rodent";
      #path = "${config.home.homeDirectory}/.zen/Funky-Rodent/";
    };
  };
}
