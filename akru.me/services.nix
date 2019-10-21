###
##
##  Services provided by akru.me machine
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

    cjdns = {
      enable = true;
      confFile = "/etc/cjdroute.conf";
    };

    syncthing = {
      enable = true;
      openDefaultPorts = true;
    };

    nginx = {
      enable = true;
      recommendedTlsSettings   = true;
      recommendedGzipSettings  = true;
      recommendedOptimisation  = true;
      virtualHosts = {
        "akru.me" = {
          forceSSL = true;
          enableACME = true;
          locations = {
            "/keybase.txt".root = "/var/www";
            "/ipns/QmWboFP8XeBtFMbNYK3Ne8Z3gKFBSR5iQzkKgeNgQz3dz4".root = "/var/www";
            "/fftlt".extraConfig = ''
              return 301 https://ipfs.io/ipfs/QmUkQADLMQ2ErtyWJT9TVYkCCNZU7EyioZxfmn2o5JUEwM;
            '';
            "/".extraConfig = ''
              return 301 https://akru.me/ipns/QmWboFP8XeBtFMbNYK3Ne8Z3gKFBSR5iQzkKgeNgQz3dz4;
            '';
          };
        };

        "h.akru.me" = {
          locations = {
            "/".extraConfig = ''
              return 301 https://akru.me/ipns/QmWboFP8XeBtFMbNYK3Ne8Z3gKFBSR5iQzkKgeNgQz3dz4;
            '';
          };
        };
      };
    };

  };
}
