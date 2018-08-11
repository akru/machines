###
##
##  Basic network configuration
##
###

{

  networking = {

    hostName = "spb.akru.me";

    # Disable new udev interface naming scheme
    usePredictableInterfaceNames = false;

    firewall = {
      allowPing = true;
      allowedTCPPorts = [ 4001 ];
      allowedUDPPorts = [ ];
    };

  };

}
