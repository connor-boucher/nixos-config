{ config, lib, ... }:

{
  options.foot.enable = lib.mkEnableOption "enables foot";

  config = lib.mkIf config.foot.enable {
    programs.foot = {
      enable = true;

      settings = {
        # Cosmetic padding
        main.pad = "30x30";
      };
    };
  };
}
