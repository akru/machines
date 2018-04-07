###
##
##  Nix package manager configuration 
##
###

{

  nix = {

    allowedUsers = [ "@wheel" ];
    useSandbox = true;

    daemonNiceLevel   = 19;
    daemonIONiceLevel = 7;
    autoOptimiseStore = true;

    binaryCaches = [
      https://cache.nixos.org
      https://hydra.aira.life
    ];

    binaryCachePublicKeys = [
      "hydra.aira.life-1:StgkxSYBh18tccd4KUVmxHQZEUF7ad8m10Iw4jNt5ak="
    ];

  };

}
