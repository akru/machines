###
##
##  Default programs in user environment
##
###

{ pkgs, ...}:

{

  # Enable unfree packages.
  nixpkgs.config.allowUnfree = true;

  programs = {
    vim.defaultEditor = true;

    wireshark.enable = true;
  
    #gnupg.agent = {
    #  enable = true;
    #  enableSshSupport = true;
    #};

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      interactiveShellInit = "ZSH_TMUX_AUTOSTART=true";
      ohMyZsh = {
        enable = true;
        theme = "gentoo";
        plugins = [ "git" "tmux" ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    # Tools
    vim zsh screen tmux htop nmap mc ncdu
    unzip sqlite rrdtool ntfs3g cifs-utils
    wireshark yrd jq

    # Security
    gnupg gnupg1compat encfs mosh
 
    # Development 
    git cmake gnumake gcc solc nodejs docker virtualbox
    qt5.full qtcreator

    # Desktop environment
    firefox google-chrome brave rxvt_unicode
    vlc scrot xbindkeys xorg.xbacklight
    geany gnome3.defaultIconTheme tdesktop
    keybase recordmydesktop transmission-gtk
  ]
    ++ (with haskellPackages; [ xmobar hlint stylish-haskell ]);

}
