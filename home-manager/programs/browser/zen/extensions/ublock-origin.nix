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
      force = true;
      permissions = [
        "alarms"
        "dns"
        "menus"
        "privacy"
        "storage"
        "tabs"
        "unlimitedStorage"
        "webNavigation"
        "webRequest"
        "webRequestBlocking"
        "<all_urls>"
        "http://*/*"
        "https://*/*"
        "file://*/*"
        "https://easylist.to/*"
        "https://*.fanboy.co.nz/*"
        "https://filterlists.com/*"
        "https://forums.lanik.us/*"
        "https://github.com/*"
        "https://*.github.io/*"
        "https://github.com/uBlockOrigin/*"
        "https://ublockorigin.github.io/*"
        "https://*.reddit.com/r/uBlockOrigin/*"
      ];
      settings = {
        advancedUserEnabled = true; #Kinda works...
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
        # Medium Mode
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

          home-manager-options.extranix.com * 3p-frame noop
          home-manager-options.extranix.com * 3p-script noop
          accounts.google.com * 3p-frame noop
          accounts.google.com * 3p-script noop
          drive.google.com * 3p-frame noop
          drive.google.com * 3p-script noop
          www.youtube.com * 3p-frame noop
          www.youtube.com * 3p-script noop
          www.reddit.com * 3p-frame noop
          www.reddit.com * 3p-script noop
          old.reddit.com * 3p-frame noop
          old.reddit.com * 3p-script noop
          ph.pinterest.com * 3p-frame noop
          ph.pinterest.com * 3p-script noop
          github.com * 3p-frame noop
          github.com * 3p-script noop
          chatgpt.com * 3p-frame noop
          chatgpt.com * 3p-script noop
          wplace.live * 3p-frame noop
          wplace.live * 3p-script noop
        '';
      };
    };
  };
}
