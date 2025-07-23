{
  imports = [
    ./fish
    ./starship.nix
  ];
  # Extra Universal Shell Tools
  programs = {
    zoxide.enable = true;
  };
}
