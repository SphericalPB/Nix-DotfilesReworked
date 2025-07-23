{pkgs, ...}: {
  imports = [
    ./stylix.nix
    #./catppuccin.nix
    #./gtk.nix
    #./qt.nix
    #./colors
  ];
  #home.file."/home/sphericalpb/.icons/Numix".source = ./.icons/Numix;
  #gtk.iconTheme.name = "Numix";
  gtk = {
    iconTheme = {
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "macchiato";
        accent = "lavender";
      };
      name = "Papirus-Dark";
    };
  };
}
