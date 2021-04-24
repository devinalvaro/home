{ pkgs, ... }:

{
  programs.go = {
    enable = true;
    goPath = ".go";
  };

  home.packages = with pkgs; [
    gccgo
    gopls
  ];
}
