{
  inputs,
  lib,
  pkgs,
  ...
}: {
  # Nix keeps complaining about unfree packages despite already having allowUnfree set to true;
  # Dirty solution: Merging the mit license with the unfree package/extension (thanks iynaix from Vimjoyer Discord!)
  programs.zen-browser.profiles.Funky-Rodent.extensions = {
    packages = with inputs.firefox-addons.packages."${pkgs.system}"; [
      (scroll_anywhere.overrideAttrs (o: {
        meta = o.meta // {license = lib.licenses.mit;};
      }))
    ];
    settings."juraj.masiar@gmail.com_ScrollAnywhere" = {
      force = true;
      permissions = ["alarms" "storage" "activeTab" "<all_urls>" "browserSettings"];
      settings = {
        scroll_button_middle = false;
        scroll_button_right = true;
        "SCROLL_TYPE" = 1;
        "MOMENTUM" = true;
      };
    };
  };
}
