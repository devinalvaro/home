let
  pkgs = import <nixos> {};
in
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    terminal = "alacritty";
    theme = ./nord.rasi;
    extraConfig = {
      modi = "window,run";
      disable-history = true;
    };
  };
}
