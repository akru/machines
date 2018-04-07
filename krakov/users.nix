###
##
##  Users available on krakov machine
##
###

{ pkgs, ... }:

{

  users.extraUsers.akru = {
    description = "Alexander Krupenkin";
    home = "/home/akru";
    shell = pkgs.zsh;
    extraGroups = [ "docker" "wireshark" "audio" "video" "dialout" "plugdev" "vboxusers" "wheel" ];
    createHome = true;
    isNormalUser = true;
    uid = 1000;
  };

}
