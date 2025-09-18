{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.minesddm.nixosModules.default];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "minesddm";
  };
}
