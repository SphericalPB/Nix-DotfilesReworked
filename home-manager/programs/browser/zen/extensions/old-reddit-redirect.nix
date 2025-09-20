{
  inputs,
  pkgs,
  ...
}: {
  programs.zen-browser.profiles.Funky-Rodent.extensions = {
    packages = with inputs.firefox-addons.packages."${pkgs.system}"; [
      old-reddit-redirect
    ];
    settings."{9063c2e9-e07c-4c2c-9646-cfe7ca8d0498}" = {
      force = true;
      permissions = [
        "declarativeNetRequestWithHostAccess"
        "https://old.reddit.com/*"
        "*://reddit.com/*"
        "*://www.reddit.com/*"
        "*://np.reddit.com/*"
        "*://amp.reddit.com/*"
        "*://i.reddit.com/*"
        "*://i.redd.it/*"
        "*://preview.redd.it/*"
      ];
    };
  };
}
