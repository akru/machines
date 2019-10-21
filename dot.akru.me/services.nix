###
##
##  Services provided by machine
##
###
{ pkgs, ... }:

{
  services = {

    openssh = {
      enable = true;
      passwordAuthentication = false;
    };

    ntp = {
      enable = true;
      servers = [ "0.pool.ntp.org" "1.pool.ntp.org" ];
    };

    cjdns.enable = true;
    cjdns.ETHInterface.bind = "eth0";

  };
}
