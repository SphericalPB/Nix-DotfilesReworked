{inputs, ...}: {
  imports = [inputs.stylix.nixosModules.stylix];
  stylix.base16Scheme = "catppuccin-macchiato";
}
