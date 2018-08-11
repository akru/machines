###
##
##  Services provided by spb.akru.me machine
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

    ipfs.enable = true;

    syncthing = {
      enable = true;
      openDefaultPorts = true;
    };

    cjdns = {
      enable = true;

      ETHInterface = {                                                                                                                 
        bind = "all";                                                                                                                  
        beacon = 2;                                                                                                                    
      };                                                                                                                               

      UDPInterface = {                                                                                                                 
        bind = "0.0.0.0:42000";                                                                                                        
        connectTo = {                                                                                                                  
          "164.132.111.49:53741" = {
            password = "cr36pn2tp8u91s672pw2uu61u54ryu8";
            publicKey = "35mdjzlxmsnuhc30ny4rhjyu5r1wdvhb09dctd1q5dcbq6r40qs0.k";
          };
        };                                                                                                                             
      };
    };

  };
}
