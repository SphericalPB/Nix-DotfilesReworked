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
        "https://reddit.com/*"
        "https://www.reddit.com/*"
        "https://np.reddit.com/*"
        "https://amp.reddit.com/*"
        "https://i.reddit.com/*"
        "https://i.redd.it/*"
        "https://preview.redd.it/*"
      ];
    };
  };
}
