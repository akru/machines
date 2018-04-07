###
##
##  Krakov machine configuration 
##
###

{
  imports = [
    ./nix.nix
    ./i18n.nix
    ./hardware.nix
    ./network.nix
    ./programs.nix
    ./services.nix
    ./users.nix
  ];

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "18.09";

}
