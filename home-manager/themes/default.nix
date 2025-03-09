{
  imports = [
    ./stylix.nix
    #./gtk.nix
    #./qt.nix
    #./colors
  ];
  home.file."/home/sphericalpb/.icons/Numix".source = ./.icons/Numix;
  gtk.iconTheme.name = "Numix";
}
