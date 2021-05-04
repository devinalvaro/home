{ pkgs, ... }:

{
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    grabKeyboardAndMouse = true;
  };

  home.packages = with pkgs; [ pinentry ];
}
