{ config, pkgs, ... }:

{
  programs.go = {
    enable = true;
    goPath = ".go";
  };

  home.sessionPath = [ "${config.home.homeDirectory}/${config.programs.go.goPath}/bin" ];

  home.packages = with pkgs; [ gopls ];
}
