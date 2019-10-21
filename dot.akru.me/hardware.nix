###
##
##  dot.akru.me machine hardware related properties
##
##  Hetzner Cloud CX21 VPS 
##
###

{ lib, ... }:

{

  imports =
    [ <nixpkgs/nixos/modules/profiles/qemu-guest.nix>
    ];

  boot = {
    initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" ];
    kernelModules = [ "kvm-intel" ];
    loader.grub = {
      version = 2;
      enable = true;
      device = "/dev/sda";
    };
  };

  fileSystems."/" =
    { device  = "/dev/disk/by-uuid/d5f92974-13d7-4cc4-9277-2b6c1f29c7f4";
      fsType  = "btrfs";
      options = [ "compress=lzo" "ssd" ];
    };

  zramSwap.enable = true;

  nix.maxJobs = lib.mkDefault 1;

}
