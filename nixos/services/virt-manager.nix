{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    spice
    spice-gtk
    spice-protocol
    virt-viewer
    #  virtio-win
  ];
  #environment.sessionVariables = {
  #  GDK_BACKEND = "x11";
  #};

  #systemd.tmpfiles.rules = let
  #  firmware = pkgs.runCommandLocal "qemu-firmware" {} ''
  #    mkdir $out
  #    cp ${pkgs.qemu}/share/qemu/firmware/*.json $out
  #    substituteInPlace $out/*.json --replace ${pkgs.qemu} /run/current-system/sw
  #  '';
  #in ["L+ /var/lib/qemu/firmware - - - - ${firmware}"];

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["sphericalpb"];
  users.users.sphericalpb.extraGroups = ["libvirtd"];

  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [
          (pkgs.OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          })
          .fd
        ];
      };
    };
  };
  virtualisation.spiceUSBRedirection.enable = true;

  #services.samba = {
  #  enable = true;
  #  settings = {
  #    LinuxHost = {
  #      path = "/home/sphericalpb/";
  #      "valid users" = "sphericalpb";
  #      public = "no";
  #      writable = "yes";
  #      printable = "no";
  #    };
  #  };
  #};
}
