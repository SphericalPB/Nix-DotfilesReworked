# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "ohci_pci" "ehci_pci" "pata_atiixp" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = ["amdgpu" "i2c-dev" "i2c-piix4"];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];
  # Disables AMD's Display Core/DisplayPort support
  # Doing so apparently makes AMD work with VGA Monitors
  boot.kernelParams = ["amdgpu.dc=0"];
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  # Installs GRUB as the Default Bootloader
  boot = {
    loader = {
      efi = {
        efiSysMountPoint = "/boot";
        canTouchEfiVariables = true;
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
      };
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/a237b1aa-fc2a-4eec-9964-70ed4279482c";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/5F58-FBBA";
    fsType = "vfat";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/74880454-0989-4e51-9fe1-12ce77b9c9c2";
    fsType = "ext4";
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}