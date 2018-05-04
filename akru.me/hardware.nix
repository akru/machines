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
    { device  = "/dev/disk/by-uuid/cff2761d-51b5-4d94-87b9-0df0f243198d";
      fsType  = "btrfs";
      options = [ "compress=lzo" "ssd" ];
    };

  fileSystems."/var/www" =
    { device = "/dev/disk/by-uuid/cff2761d-51b5-4d94-87b9-0df0f243198d";
      fsType = "btrfs";
      options = [ "subvol=var/www" ];
    };

  fileSystems."/var/lib/ipfs" =
    { device = "/dev/disk/by-uuid/cff2761d-51b5-4d94-87b9-0df0f243198d";
      fsType = "btrfs";
      options = [ "subvol=var/lib/ipfs" ];
    };

  zramSwap.enable = true;

  nix.maxJobs = lib.mkDefault 1;

}
