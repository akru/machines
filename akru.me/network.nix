###
##
##  Basic network configuration
##
###

{

  networking = {

    hostName = "akru.me";

    # Disable new udev interface naming scheme
    usePredictableInterfaceNames = false;

    firewall = {
      allowPing = true;
      allowedTCPPorts = [ 80 443 4001 30333 30363 3414 31163 ];
      allowedUDPPorts = [ 53741 58160 ];
    };

    # Enable IPv6
    interfaces.eth0.ipv6.addresses = [ { address = "2a01:4f9:c010:382a::"; prefixLength = 64; } ];
    defaultGateway6 = {
      address = "fe80::1";
      interface = "eth0";
    };

  };

}
