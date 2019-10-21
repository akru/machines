###
##
##  Basic network configuration
##
###

{

  networking = {

    hostName = "dot.akru.me";

    # Disable new udev interface naming scheme
    usePredictableInterfaceNames = false;

    firewall = {
      allowPing = true;
      allowedTCPPorts = [ 30333 ];
      allowedUDPPorts = [ ];
    };

    # Enable IPv6
    interfaces.eth0.ipv6.addresses = [ { address = "2a01:4f9:c010:5d1::"; prefixLength = 64; } ];
    defaultGateway6 = {
      address = "fe80::1";
      interface = "eth0";
    };

  };

}
