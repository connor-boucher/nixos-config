{ config, lib, ... }:

{
  options.browsers.qutebrowser.enable = lib.mkEnableOption "enables qutebrowser";

  config = lib.mkIf config.browsers.qutebrowser.enable {
    programs.qutebrowser = {
      enable = true;
    };
  };
}
