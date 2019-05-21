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
      https://aira.cachix.org
    ];

    binaryCachePublicKeys = [
      "aira.cachix.org-1:/5nHPqhVrtvt7KCk04I8cH/jETANk8BtPHWsEtcwU/M="
    ];

    gc.automatic = true;
    gc.options = "--delete-older-than 14d";

  };

}
