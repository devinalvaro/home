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
      # General:
      modi = "window,run";
      disable-history = true;
      # Bindings:
      kb-remove-to-eol = ""; # Unbind Control+k.
      kb-accept-entry = "Control+m,Return,KP_Enter"; # Unbind Control+j.
      kb-row-up = "Up,Control+p,ISO_Left_Tab,Control+k"; # Bind Control+k.
      kb-row-down = "Down,Control+n,Control+j"; # Bind Control+j.
    };
  };
}
