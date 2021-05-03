{ pkgs, ... }:

{
  xdg.configFile.spectrwm = {
    source = ./spectrwm;
  };

  home.packages = with pkgs; [
    xsecurelock
  ];
}
