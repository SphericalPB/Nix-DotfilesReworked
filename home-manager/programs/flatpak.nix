{
  inputs,
  lib,
  ...
}: {
  # Declarative Flatpak Manager for NixOS
  # https://github.com/gmodena/nix-flatpak
  imports = [inputs.nix-flatpak.homeManagerModules.nix-flatpak];

  services.flatpak = {
    enable = true;
    #update.auto = {
    #  enable = true;
    #  onCalendar = "weekly";
    #  #onActivation = true;
    #};
    remotes = lib.mkOptionDefault [
      {
        name = "flathub-beta";
        location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
      }
    ];

    packages = [
      {
        flatpakref = "https://sober.vinegarhq.org/sober.flatpakref";
        sha256 = "1pj8y1xhiwgbnhrr3yr3ybpfis9slrl73i0b1lc9q89vhip6ym2l";
      }
      "com.usebottles.bottles"
    ];
  };
}
