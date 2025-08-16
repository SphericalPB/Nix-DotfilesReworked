{
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.zen-browser.profiles.Funky-Rodent.extensions = {
    packages = with inputs.firefox-addons.packages."${pkgs.system}"; [
      (scroll_anywhere.overrideAttrs (o: {
        meta = o.meta // {license = lib.licenses.mit;};
      }))
    ];
    settings = {
      "juraj.masiar@gmail.com_ScrollAnywhere".settings = {
        force = true;
        scroll_button_middle = false;
        scroll_button_right = true;
        "SCROLL_TYPE" = 1;
        "MOMENTUM" = true;
      };
    };
  };
}
