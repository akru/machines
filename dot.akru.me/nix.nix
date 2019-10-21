###
##
##  Nix package manager configuration 
##
###

{

  nix = {

    useSandbox = true;

    daemonNiceLevel   = 19;
    daemonIONiceLevel = 7;
    autoOptimiseStore = true;

    binaryCaches = [
      https://cache.nixos.org
    ];

    binaryCachePublicKeys = [
    ];

    gc.automatic = true;
    gc.options = "--delete-older-than 14d";

  };

}
