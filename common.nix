{ config, ... }:

{
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Load scripts into .local/bin.
  home = {
    sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];
    file.".local/bin".source = ./scripts;
  };
}
