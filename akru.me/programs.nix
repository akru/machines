###
##
##  Default programs in user environment
##
###

{ pkgs, ...}:

{

  programs = {
    vim.defaultEditor = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "gentoo";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    vim git zsh htop nmap ncdu
  ];

}
