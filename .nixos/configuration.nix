{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.wlp2s0.useDHCP = true;

  # Networking stuff.
  networking.hostName = "rome";
  networking.networkmanager.enable = true;

  # Set time zone.
  time.timeZone = "Asia/Singapore";

  # Enable X11.
  services.xserver.enable = true;
  services.xserver.resolutions = [
    {
      x = 1600;
      y = 900;
    }
  ];

  # Enable auto-login.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "devin";

  # Enable SpectrWM.
  services.xserver.windowManager.spectrwm.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad.
  services.xserver.libinput.enable = true;

  # Enable light.
  programs.light.enable = true;

  # Enable fish.
  programs.fish.enable = true;

  # Set fonts.
  fonts.fonts = with pkgs; [ fira-code ];
  fonts.fontconfig.defaultFonts = {
    monospace = [ "Fira Code" ];
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    alacritty
    bat
    emacs
    exa
    fd
    firefox
    git
    gitAndTools.delta
    neovim
    ripgrep
    rofi
    sd
    starship
    wget
    xsecurelock
    zathura
  ];

  # Define user accounts.
  users.mutableUsers = false;
  users.users.devin = {
    isNormalUser = true;
    description = "Devin Alvaro";
    extraGroups = [ "networkmanager" "video" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$6$LYWKF1QF0Gv6osFq$GGqSLkS5kSoutvmxNL3NpZfyHZz2lCV5kVJ2G3P.53bOaNOY9Gdf0gqQWtb7HSpYaX68PVuMQEcX/Ni7psnHW0";
  };

}
