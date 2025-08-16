{
  inputs,
  pkgs,
  ...
}: {
  programs.zen-browser.profiles.Funky-Rodent.extensions = {
    packages = with inputs.firefox-addons.packages."${pkgs.system}"; [
      ublock-origin
    ];
    settings."uBlock0@raymondhill.net" = {
      settings = {
        advancedUserEnabled = true; #Currently does not work..ish
        selectedFilterLists = [
          "user-filters"
          "ublock-filters"
          "ublock-badware"
          "ublock-privacy"
          "ublock-unbreak"
          "ublock-quick-fixes"
          "easylist"
          "easyprivacy"
          "urlhaus-1"
          "plowe-0"
        ];
        hostnameSwitchesString = ''
          no-csp-reports: * true
          no-large-media: behind-the-scene false
        '';
        dynamicFilteringString = ''
          * * 3p-frame block
          * * 3p-script block
          behind-the-scene * * noop
          behind-the-scene * 1p-script noop
          behind-the-scene * 3p noop
          behind-the-scene * 3p-frame noop
          behind-the-scene * 3p-script noop
          behind-the-scene * image noop
          behind-the-scene * inline-script noop
        '';
      };
    };
  };
}
