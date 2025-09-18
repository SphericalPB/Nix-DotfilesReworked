{
  inputs,
  pkgs,
  ...
}: {
  programs.zen-browser.profiles.Funky-Rodent.extensions = {
    packages = with inputs.firefox-addons.packages."${pkgs.system}"; [
      youtube-shorts-block
    ];
    settings."{34daeb50-c2d2-4f14-886a-7160b24d66a4}" = {
      force = true;
      permissions = [
        "storage"
        "*://*.youtube.com/*"
        "*://m.youtube.com/*"
        "activeTab"
        "browsingData"
      ];
      settings = {
        isEnable = true;
        isHideTabs = true;
        isHideVideos = true;
      };
    };
  };
}
