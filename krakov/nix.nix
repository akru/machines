###
##
##  Nix package manager configuration 
##
###

{

  nix = {

    allowedUsers = [ "@wheel" ];
    useSandbox = false;

    daemonNiceLevel   = 19;
    daemonIONiceLevel = 7;
    autoOptimiseStore = true;

    binaryCaches = [
      https://cache.nixos.org
      https://hydra.iohk.io
      https://aira.cachix.org
      https://dapp.cachix.org
      https://akru.cachix.org
      https://pact.cachix.org
      https://nixcache.reflex-frp.org
      http://nixcache.kadena.io
    ];

    binaryCachePublicKeys = [
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "aira.cachix.org-1:/5nHPqhVrtvt7KCk04I8cH/jETANk8BtPHWsEtcwU/M="
      "dapp.cachix.org-1:9GJt9Ja8IQwR7YW/aF0QvCa6OmjGmsKoZIist0dG+Rs="
      "akru.cachix.org-1:zW6wBUC613W7ADddLhpIq1/6rp35Bq1sIAg0MMVelrk="
      "pact.cachix.org-1:cg1bsryGrHnQzqEp52NcHq4mBBL+R25XbR2Q/I/vQ8Y="
      "ryantrinkle.com-1:JJiAKaRv9mWgpVAz8dwewnZe0AzzEAzPkagE9SP5NWI="
      "kadena-cache.local-1:8wj8JW8V9tmc5bgNNyPM18DYNA1ws3X/MChXh1AQy/Q="
    ];

  };

}
