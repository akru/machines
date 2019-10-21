###
##
##  akru.me machine hardware related properties
##
##  OVH tiny vds 
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
    { device  = "/dev/disk/by-uuid/c9bd6699-9388-4062-b1a5-ed7e396213d7";
      fsType  = "btrfs";
      options = [ "compress=lzo" "ssd" ];
    };

  zramSwap.enable = true;

  nix.maxJobs = lib.mkDefault 1;

}
