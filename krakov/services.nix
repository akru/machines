###
##
##  Services provided by krakov machine
##
###

{ pkgs, ... }:

{

  virtualisation = {
    # Enable docker host support
    docker.enable = true;

    # Enable VirtualBox host support 
    virtualbox.host.enable = true;
  };

  services = {

    nscd.enable = false;

    # Enable the OpenSSH daemon.
    openssh = {
      enable = true;
      passwordAuthentication = false;
    };

    # Enable SOCKS proxy via akru.me
    autossh.sessions = [ {
      name = "akru.me";
      user = "akru";
      extraArguments = "-N -D9051 akru.me";
    } ];

    # udev extra config
    udev = {
      extraRules = ''
        # Trezor HID interface 
        KERNEL=="hidraw*", ATTRS{busnum}=="1", ATTRS{idVendor}=="534c", ATTRS{idProduct}=="0001", MODE="0666"
      '';
    };

    # ThinkPad ACPI
    acpid = {
      enable = true;
      powerEventCommands = ''
        shutdown -h now
      '';
      lidEventCommands = ''
        echo 3 > /proc/acpi/ibm/beep
      '';
      acEventCommands = ''
        echo 4 > /proc/acpi/ibm/beep
      '';
    };

    # TLP Linux Advanced Power Management
    tlp.enable = true;

    # Time synchronization.
    ntp = {
      enable = true;
      servers = [ "0.pool.ntp.org" "1.pool.ntp.org" ];
    };

#    iodine.clients = {
#      akru = {
#        server = "a.akru.me";
#        relay = "10.240.0.100";
#        extraConfig = "-M 200 -I 1 -L 0 -m 90";
#      };
#    };

    # Enable print support
    #printing.enable = true;
    
    # TFTP server for router upgrades
    #tftpd.enable = true;

    # OpenVPN
    #openvpn.servers.airalab.config = '' config /etc/openvpn/airalab.conf '';

    # Cjdns routing service.
    cjdns = {
      enable = true;
      ETHInterface = {
        bind = "all";
        beacon = 2;
      };
      UDPInterface = {
        bind = "0.0.0.0:42000";
        connectTo = {
          # h.akru.me/FR/Strasbourg
          "95.216.202.55:53741" = {
            password = "cr36pn2tp8u91s672pw2uu61u54ryu8";
            publicKey = "35mdjzlxmsnuhc30ny4rhjyu5r1wdvhb09dctd1q5dcbq6r40qs0.k";
          };
        };
      };
      #ipTunnel.outgoingConnections = [ "35mdjzlxmsnuhc30ny4rhjyu5r1wdvhb09dctd1q5dcbq6r40qs0.k" ];
    };

    # Enable TOR proxy
    tor.enable = true;
    tor.client.enable = true;
    tor.client.dns.enable = true;

    # Inter planetary file system
    ipfs = {
      enable = true;
      extraFlags = [ "--enable-namesys-pubsub" ];
    };

    # Decentralized synchonization
    syncthing = {
      enable = true;
      user = "akru";
      dataDir = "/home/akru/.syncthing";
      openDefaultPorts = true;
    };

    # Enable TREZOR support
    trezord.enable = true;

    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      layout = "us,ru";
      videoDrivers = [ "intel" ];
      xkbOptions = "grp:caps_toggle, grp_led:caps";

      windowManager = {
        xmonad.enable = true;
        xmonad.enableContribAndExtras = true;
        default = "xmonad";
      };

      desktopManager = {
        xterm.enable = false;
        default = "none";
      };

      displayManager = {
        slim.enable = true;
        slim.autoLogin = true;
        slim.defaultUser = "akru";
        sessionCommands = with pkgs; ''
          ${xlibs.xrdb}/bin/xrdb -merge ~/.Xresources
          ${xlibs.xsetroot}/bin/xsetroot -cursor_name left_ptr
          ${feh}/bin/feh --bg-scale ~/images/wall.jpg &
          ${xbindkeys}/bin/xbindkeys
          ${trayer}/bin/trayer --edge top --align right --expand true --SetDockType true --width 4 --height 26 --transparent true --tint 0x000000 &
        '';
      };
    };
  };

  # Enable fonts
  fonts = {
    enableCoreFonts = true;
    enableFontDir = true;
    fonts = with pkgs; [
      fira-code
      dejavu_fonts
      ubuntu_font_family
    ];
  };

}
