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
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "gentoo";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    vim git zsh htop ncdu screen nodejs-10_x
  ];

}
