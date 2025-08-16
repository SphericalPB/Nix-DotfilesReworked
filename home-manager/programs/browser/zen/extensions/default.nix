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
    ./improved-tube.nix
  ];
  programs.zen-browser.profiles.Funky-Rodent = {
    extensions = {
      force = true; # Force replace existing extensions
      # Nix keeps complaining about unfree packages despite already having allowUnfree set to true;
      # Dirty solution: Merging the mit license with the unfree package/extension (thanks iynaix from Vimjoyer Discord!)
      packages = with inputs.firefox-addons.packages."${pkgs.system}"; [
        bitwarden
        floccus
        web-scrobbler
        stylus
        # Privacy
        disconnect
        decentraleyes
        privacy-badger
        cookie-autodelete
        istilldontcareaboutcookies
        clearurls
        # Youtube
        youtube-shorts-block
        return-youtube-dislikes
        sponsorblock
        dearrow
      ];
    };
  };
}
