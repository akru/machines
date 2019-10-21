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
        fc8a:63db:c677:9c93:ac4d:6048:53f7:21d3 duna14
        fc0a:f6f7:392f:941c:3612:1267:75cb:1715 doondle
        fce9:849c:a311:845b:f3a9:a8fc:7b34:4ab6 hydra
        fc42:29df:dd98:605c:9b01:1ffe:e03a:54ee lighthouse
        fc5a:fd8d:96b5:14d2:944e:6a53:2be:1b95  citadel
        fcaa:9c13:6ea4:4b92:8b9b:9:2390:52c1    polkadot
        fcc5:8c45:cede:ac0d:e9c4:aba4:1ed5:895  aira-teamcity
        fca7:7227:1d8e:3757:c2fe:f758:7fcd:2cf3 drone-sim-01
        fc8f:c559:475e:fa39:e6fc:2b12:5c43:7167 aira-iot-01
  	fcb0:5ae8:6bf2:f734:8871:ece3:79ff:42b3 aira-iot-02
        fcbd:1e78:bd7a:650e:6ca9:7aa6:b844:7a00 fftlt-spor33
        fc8f:1cb:fb66:efbe:77c9:594d:f638:8390  hydra2
        fc0e:0f69:1e44:603e:0e14:4ec8:901a:ab3e victory
      '';

    firewall = {
      allowPing = true;
      allowedTCPPorts = [ 8080 4001 5000 42000 62820 9090 ];
      allowedUDPPorts = [ 62882 5353 ];
    };

    wireless = {
      enable = true;
      interfaces = [ "wlan0" ];
      networks = import ./wireless.nix;
    };

  };

}
