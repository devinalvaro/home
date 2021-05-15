{
  services.grobi = {
    enable = true;
    rules = [
      {
        name = "Large";
        outputs_connected = [ "HDMI-2" ];
        primary = "HDMI-2";
        configure_single = "HDMI-2@1920x1080";
      }
      {
        name = "Small";
        configure_single = "eDP-1@1600x900";
      }
    ];
  };
}
