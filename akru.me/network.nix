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
      allowedTCPPorts = [ 80 443 4001 30333 3414 31163 ];
      allowedUDPPorts = [ 53741 58160 ];
    };

    # Enable IPv6
    interfaces.eth0.ipv6.addresses = [ { address = "2001:41d0:401:3100::34e6"; prefixLength = 64; } ];
    defaultGateway6 = {
      address = "2001:41d0:0401:3100::1";
      interface = "eth0";
    };

  };

}
