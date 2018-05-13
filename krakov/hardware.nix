###
##
##  Krakov machine hardware related properties
##
##  Lenovo X1 Carbon 5 Gen
##
###

{ lib, ... }:

{

  boot = {
    # Use the systemd-boot EFI boot loader.
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    initrd.availableKernelModules = [ "xhci_pci" "nvme" ];
    initrd.luks.devices."root".device = "/dev/disk/by-uuid/2def1911-273b-456e-a723-634e0685abd1";

    kernelModules = [ "kvm-intel" "fbcon" ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/affcb4ca-6c26-47db-9720-a5f1f47f4669";
      fsType = "btrfs";
      options = [ "compress=lzo" "commit=120" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/269B-D34E";
      fsType = "vfat";
    };
  };

  # Enable swap partition based on compressed memory
  zramSwap.enable = true;

  hardware = {
    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = true;

    trackpoint = {
      enable = true;
      emulateWheel = true;
      fakeButtons = true;
      speed = 200;
      sensitivity = 140;
    };

    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
  }; 

  # Intel(R) Core(TM) i7-7500U CPU @ 2 core
  nix.maxJobs = lib.mkDefault 2;
  nix.buildCores = lib.mkDefault 2;

  sound.enable = true;

}
