###
##
##  Basic network configuration
##
###

{

  networking = {

    hostName = "krakov";

    # Disable new udev interface naming scheme
    usePredictableInterfaceNames = false;

    extraHosts =
      ''
        127.0.0.1                               krakov
        fccd:6e2e:4f18:eb11:e6a8:993e:fc4:a6b   supernode
        fc6c:99a2:171a:f36a:8cd0:cc6b:efb7:8bb4 strasbourg
        fc21:6440:23b6:4a40:d36c:fb8d:b449:2dd9 tltoffice
        fcab:8e05:92df:1e6b:fc1c:4f8:c9b9:d890  csigeiger
        fc97:2c1d:9c2d:0fbd:0810:5685:625c:3b6f router
        fcb9:394a:2837:2d0c:ca26:1f39:5072:6d3b wh1080
        fcc9:92ed:1462:3c85:c78c:6e8b:2175:16d7 sove32
        fc7a:a2d4:e970:6e1c:2e9c:eee2:74ef:85a1 pole14
        fc53:68fb:5f29:c4e5:a846:1e1f:b9c8:1c99 hydra
      '';

    firewall = {
      allowPing = true;
      allowedTCPPorts = [ 4001 51413 ];
    };

    wireless = {
      enable = true;
      networks = import ./wireless.nix;
    };

  };
}
