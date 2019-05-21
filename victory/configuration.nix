# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <nixpkgs/nixos/modules/profiles/minimal.nix>
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "victory"; # Define your hostname.
    nat.enable = true;
    nat.internalInterfaces = ["ve-+"];
    nat.externalInterface = "eno1";
  };

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  containers.aira = {
    autoStart = true;
    enableTun = true;
    privateNetwork = true;
    hostAddress = "192.168.100.10";
    localAddress = "192.168.100.11";

    config = { config, pkgs, ... }:
      {
        imports =
        [ <nixpkgs/nixos/modules/installer/aira.nix>
          <nixpkgs/nixos/modules/profiles/aira-foundation.nix>
        ];
        services.mingetty.autologinUser = "root";
        users.extraUsers.root.openssh.authorizedKeys.keys =
        [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDjNHoP86ELLylAizWEvlZqceMXnEup6OZi8JEGng8NJ12d7ofqMzy+yQEPgzzFX1Cr6oTKtzMMLFg5+T0gN/xSbd/Yvu62K8gUoePHajKg/rT78LBjFLpSHZEHjS2vlRenmgMbT1y3qJe99iw+xmJ6P1p9mRlB5xsAC+gCd5kRbw4vO7im3mi6qd6gZZql+fyFRkoVdM0DF0hR4AMAUPM9PGJsSkoMN5PxvCw048f/+0sc5zXMTqy83/eoaYYOu9AtpaXQUqErI8OHJ0DZoai3w0fKXBj9eNt3h0eTBFUXAjjsvRjx0QkOnyBrZKYXk3tEnIThWJy2qmMY4IOZRyO4RhMC/zBmSJKg5ji7CUeOEnDAs4s2INNVybc0r2ms9BXqIiC+TtjiJImJyjQ2KHkRXLsCHVj9ned9NgcVSJrqA34Ywpu4wmyvAANfsa6Ubz29JoMCeTH7h+W77hw3DF59I5Ju6PBSkg0Z4Vh9xMuocVYiRRI4gBDOuf7yQn+kS6h7Kr69fbXijqccy5jkUn/90aAwzmz3FaXasE+n/StC0IrCkksnitiPwfvh3a67GC/2W6H2gqPvIW6t571NI3sYD24FKtae+T/ROLnwDk6GUFuaWN7ZehsYfE7mS5dXwXY+YxP2kmNgWr7r5dkdj5mm7y71mDyKbAd9XwGg7Q5LdQ=="
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKLB7lnUc9iy4UYdAl5q2qmrB1VEuRMcucluAe6WFpYV khassanov@32vd"
        ];
      };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    screen vim htop nodejs-10_x
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services = {
    openssh.enable = true;
    ipfs.enable = true;
    ipfs.extraFlags = [ "--enable-pubsub-experiment" ];
    cjdns = {
      enable = true;
      ETHInterface.bind = "all";
      UDPInterface = {
        bind = "0.0.0.0:42000";
        connectTo = {
          # h.akru.me/FR/Strasbourg
          "164.132.111.49:53741" = {
            password = "cr36pn2tp8u91s672pw2uu61u54ryu8";
            publicKey = "35mdjzlxmsnuhc30ny4rhjyu5r1wdvhb09dctd1q5dcbq6r40qs0.k";
          };
        };
      };
    };
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 4001 30333 31163 ];
  networking.firewall.allowedUDPPorts = [ 30333 31163 ];

  users.extraUsers.root.openssh.authorizedKeys.keys =
  [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDjNHoP86ELLylAizWEvlZqceMXnEup6OZi8JEGng8NJ12d7ofqMzy+yQEPgzzFX1Cr6oTKtzMMLFg5+T0gN/xSbd/Yvu62K8gUoePHajKg/rT78LBjFLpSHZEHjS2vlRenmgMbT1y3qJe99iw+xmJ6P1p9mRlB5xsAC+gCd5kRbw4vO7im3mi6qd6gZZql+fyFRkoVdM0DF0hR4AMAUPM9PGJsSkoMN5PxvCw048f/+0sc5zXMTqy83/eoaYYOu9AtpaXQUqErI8OHJ0DZoai3w0fKXBj9eNt3h0eTBFUXAjjsvRjx0QkOnyBrZKYXk3tEnIThWJy2qmMY4IOZRyO4RhMC/zBmSJKg5ji7CUeOEnDAs4s2INNVybc0r2ms9BXqIiC+TtjiJImJyjQ2KHkRXLsCHVj9ned9NgcVSJrqA34Ywpu4wmyvAANfsa6Ubz29JoMCeTH7h+W77hw3DF59I5Ju6PBSkg0Z4Vh9xMuocVYiRRI4gBDOuf7yQn+kS6h7Kr69fbXijqccy5jkUn/90aAwzmz3FaXasE+n/StC0IrCkksnitiPwfvh3a67GC/2W6H2gqPvIW6t571NI3sYD24FKtae+T/ROLnwDk6GUFuaWN7ZehsYfE7mS5dXwXY+YxP2kmNgWr7r5dkdj5mm7y71mDyKbAd9XwGg7Q5LdQ==" ];

  nix = {
    autoOptimiseStore = true;

    binaryCaches = [
      https://cache.nixos.org
      https://aira.cachix.org
      https://dapp.cachix.org
    ];

    binaryCachePublicKeys = [
      "aira.cachix.org-1:/5nHPqhVrtvt7KCk04I8cH/jETANk8BtPHWsEtcwU/M="
      "dapp.cachix.org-1:9GJt9Ja8IQwR7YW/aF0QvCa6OmjGmsKoZIist0dG+Rs="
    ];
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

}
