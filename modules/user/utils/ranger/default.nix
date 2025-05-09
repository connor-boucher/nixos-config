{ config, lib, ... }:

{
  options.utils.ranger.enable = lib.mkEnableOption "enables ranger";

  config = lib.mkIf config.utils.ranger.enable {
    programs.ranger = {
      enable = true;

      settings = {
        column_ratios = "1,2,2";
        draw_borders = true;
      };
    };
  };
}
