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
      enableAutosuggestions = true;
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
    vim zsh tmux htop nmap mc ncdu
    unzip sqlite rrdtool ipfs ntfs3g

    # Security
    gnupg gnupg1compat encfs mosh
 
    # Development 
    git cmake gnumake gcc stack solc
    nix-repl nixops nodejs-8_x octave
    docker virtualbox
    pythonPackages.virtualenv
    haskellPackages.stylish-haskell
    haskellPackages.ghc-mod

    # Desktop environment
    firefox google-chrome haskellPackages.xmobar
    libreoffice vlc scrot xbindkeys xorg.xbacklight
    geany gnome3.defaultIconTheme
    keybase recordmydesktop rtorrent

    # Linux
    linuxPackages.acpi_call
  ];

}
