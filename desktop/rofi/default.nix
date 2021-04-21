{
  programs.rofi = {
    enable = true;
    terminal = "alacritty";
    theme = ./nord.rasi;
    extraConfig = ''
      rofi.modi: window,run
      rofi.disable-history: true
    '';
  };
}
