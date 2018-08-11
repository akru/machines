###
##
##  spb.akru.me machine hardware related properties
##
##  Xeon E2670
##
###
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "ehci_pci" "ahci" "xhci_pci" "usb_storage" "usbhid" "sd_mod" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/9deeec9a-0fdb-4e4c-b9e7-7bde58a80b6b";
      fsType = "btrfs";
      options = [ "compress=lzo" "discard" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/1BD7-DDFD";
      fsType = "vfat";
    };

  zramSwap.enable = true;

  nix.maxJobs = lib.mkDefault 16;
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
}
