# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  inputs,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    inputs.minegrub-theme.nixosModules.default
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = ["amdgpu"];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];
  # Custom Kernel, because, why not :)
  boot.kernelPackages = pkgs.linuxPackages_zen;
  # Installs GRUB as the Default Bootloader
  boot.loader = {
    efi = {
      efiSysMountPoint = "/boot";
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      minegrub-theme = {
        enable = true;
        splash = "I.. am Steve!";
        background = "background_options/1.8  - [Classic Minecraft].png";
        boot-options-count = 4;
      };
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/5ed6cc43-aa23-4d7c-8ea7-e63c0d5fd9ab";
    fsType = "btrfs";
    options = ["subvol=root" "compress=zstd"];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/5ed6cc43-aa23-4d7c-8ea7-e63c0d5fd9ab";
    fsType = "btrfs";
    options = ["subvol=home" "compress=zstd"];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/5ed6cc43-aa23-4d7c-8ea7-e63c0d5fd9ab";
    fsType = "btrfs";
    options = ["subvol=nix" "compress=zstd" "noatime"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/1F5D-38A0";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  fileSystems."/swap" = {
    device = "/dev/disk/by-uuid/5ed6cc43-aa23-4d7c-8ea7-e63c0d5fd9ab";
    fsType = "btrfs";
    options = ["subvol=swap" "noatime"];
  };

  fileSystems."/run/media/sphericalpb/e6c0084e-1793-48cd-9fec-9ab549d2791e" = {
    device = "/dev/disk/by-uuid/e6c0084e-1793-48cd-9fec-9ab549d2791e";
    fsType = "ext4";
  };

  #swapDevices = [];
  #swapDevices = [
  #  {
  #    device = "/swap/swapfile";
  #    priority = 1;
  #  }
  #];

  # Change how aggressive the kernel uses the swap space
  #boot.kernel.sysctl = {"vm.swappiness" = 10;};

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 30;
    priority = 100;
  };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp3s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
