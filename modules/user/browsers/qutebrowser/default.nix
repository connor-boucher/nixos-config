{ config, lib, ... }:

{
  options.qutebrowser.enable = lib.mkEnableOption "enables qutebrowser";

  config = lib.mkIf config.qutebrowser.enable {
    programs.qutebrowser = {
      enable = true;
    };
  };
}
