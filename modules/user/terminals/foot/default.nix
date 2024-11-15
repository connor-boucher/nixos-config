{ config, lib, ... }:

{
  options.foot.enable = lib.mkEnableOption "enables foot";

  config = {
    programs.foot = lib.mkIf config.foot.enable {
      enable = true;

      settings = {
        # Cosmetic padding
        main.pad = "30x30";
      };
    };
  };
}
