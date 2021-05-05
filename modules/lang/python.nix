{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ python3 ];

  home = {
    sessionVariables.PYTHONUSERBASE = "${config.home.homeDirectory}/.pip";
    sessionPath = [ "${config.home.sessionVariables.PYTHONUSERBASE}/bin" ];
  };
}
