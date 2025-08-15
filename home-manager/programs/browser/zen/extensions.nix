{
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.zen-browser.profiles.Funky-Rodent = {
    extensions = {
      force = true; # Force replace existing extensions
      # Nix keeps complaining about unfree packages despite already having allowUnfree set to true;
      # Dirty solution: Merging the mit license with the unfree package/extension (thanks iynaix from Vimjoyer Discord!)
      packages = with inputs.firefox-addons.packages."${pkgs.system}"; [
        bitwarden
        floccus
        stylus
        vimium-c
        web-scrobbler
        (scroll_anywhere.overrideAttrs (o: {
          meta = o.meta // {license = lib.licenses.mit;};
        }))
        # Privacy
        disconnect
        ublock-origin
        decentraleyes
        privacy-badger
        cookie-autodelete
        istilldontcareaboutcookies
        clearurls
        # Youtube
        (improved-tube.overrideAttrs (o: {
          meta = o.meta // {license = lib.licenses.mit;};
        }))
        youtube-shorts-block
        return-youtube-dislikes
        sponsorblock
        dearrow
      ];
      # Settings follow the format used inside that extension's backup files
      settings = {
        # Ublock Origin
        "uBlock0@raymondhill.net".settings = {
          force = true;
          userSettings.advancedUserEnabled = true;
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
          dynamicFilteringString = "no-csp-reports: * true no-large-media: behind-the-scene false behind-the-scene * * noop behind-the-scene * 1p-script noop behind-the-scene * 3p noop behind-the-scene * 3p-frame noop behind-the-scene * 3p-script noop behind-the-scene * image noop behind-the-scene * inline-script noop* * 3p-script block * * 3p-frame block";
        };
      };
    };
  };
}
