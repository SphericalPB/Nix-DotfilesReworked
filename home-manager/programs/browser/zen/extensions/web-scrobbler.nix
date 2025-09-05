{
  inputs,
  pkgs,
  ...
}: {
  programs.zen-browser.profiles.Funky-Rodent.extensions = {
    packages = with inputs.firefox-addons.packages."${pkgs.system}"; [
      web-scrobbler
    ];
    settings."{799c0914-748b-41df-a25c-22d008f9e83f}" = {
      permissions = ["storage" "contextMenus" "scripting" "notifications" "<all_urls>" "browsingData"];
    };
  };
}
