{ pkgs, ... }:

{
  programs.go = {
    enable = true;
    goPath = "$HOME/.go";
  };

  home.packages = with pkgs; [
    gccgo
    gopls
  ];
}
