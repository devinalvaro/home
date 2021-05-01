{ config, ... }:

{
  home = {
    sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];
    file.".local/bin" = {
      source = ./scripts;
    };
  };
}
