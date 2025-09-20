{
  inputs,
  lib,
  pkgs,
  ...
}: {
  # References/Modifies .zen/<profileName>/browser-extension-data/<extensionID>/storage.js
  imports = [
    ./ublock-origin.nix
    ./vimium-c.nix
    ./scroll-anywhere.nix
    ./web-scrobbler.nix
    ./improved-tube.nix # Currently only works if you interact with it in the extensions menu
    ./youtube-shorts-block.nix
    ./old-reddit-redirect.nix
  ];
  programs.zen-browser.profiles.Funky-Rodent = {
    settings = {
      #"extensions.autoDisableScopes" = 0;
    };
    extensions = {
      force = true; # Force replace existing extensions

      # NOTICE: Nix keeps complaining about unfree packages despite already having allowUnfree set to true;
      # Dirty solution: Merging the mit license with the unfree package/extension (thanks iynaix from Vimjoyer Discord!)

      # To show the list of available extensions:
      # nix flake show "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"
      packages = with inputs.firefox-addons.packages."${pkgs.system}"; [
        bitwarden
        floccus
        auto-tab-discard
        stylus
        (tampermonkey.overrideAttrs (o: {
          meta = o.meta // {license = lib.licenses.mit;};
        }))
        # Privacy
        disconnect
        decentraleyes
        privacy-badger
        cookie-autodelete
        istilldontcareaboutcookies
        clearurls
        # Youtube
        youtube-nonstop
        return-youtube-dislikes
        sponsorblock
        dearrow
      ];
    };
  };
}
