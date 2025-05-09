{ config, lib, ... }:

{
  options.terminals.foot.enable = lib.mkEnableOption "enables foot";

  config = lib.mkIf config.terminals.foot.enable {
    programs.foot = {
      enable = true;

      settings = {
        # Cosmetic padding
        main.pad = "30x30";
      };
    };
  };
}
