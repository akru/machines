###
##
##  Services provided by akru.me machine
##
###

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

    ipfs.enable = true;

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

            "/ipns/QmWboFP8XeBtFMbNYK3Ne8Z3gKFBSR5iQzkKgeNgQz3dz4/".root = "/var/www";

            "/".extraConfig = ''
              return 301 https://$host/ipns/QmWboFP8XeBtFMbNYK3Ne8Z3gKFBSR5iQzkKgeNgQz3dz4/;
            '';
          };
        };

        "h.akru.me" = {
          locations = {
            "/ipns/QmWboFP8XeBtFMbNYK3Ne8Z3gKFBSR5iQzkKgeNgQz3dz4/".root = "/var/www";

            "/".extraConfig = ''
              return 301 http://$host/ipns/QmWboFP8XeBtFMbNYK3Ne8Z3gKFBSR5iQzkKgeNgQz3dz4/;
            '';
          };
        };
      };
    };

  };
}
