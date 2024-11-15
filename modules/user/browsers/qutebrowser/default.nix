{ config, lib, ... }:

{
  options.qutebrowser.enable = lib.mkEnableOption "enables qutebrowser";

  config = {
    programs.qutebrowser = lib.mkIf config.qutebrowser.enable {
      enable = true;
    };
  };
}
