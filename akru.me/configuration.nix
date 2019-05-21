###
##
##  akru.me machine configuration 
##
###

{

  imports = [
    ./hardware.nix
    ./services.nix
    ./programs.nix
    ./network.nix
    ./users.nix
    ./i18n.nix
    ./nix.nix
  ];

  system = {
    # The NixOS release to be compatible with for stateful data such as databases.
    stateVersion = "19.03";

    # Enable periodic distribution upgrades
    autoUpgrade.enable = true;
  };

}
