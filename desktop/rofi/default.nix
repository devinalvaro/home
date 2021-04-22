{
  programs.rofi = {
    enable = true;
    terminal = "alacritty";
    theme = ./nord.rasi;
    extraConfig = {
      modi = "window,run";
      disable-history = true;
    };
  };
}
