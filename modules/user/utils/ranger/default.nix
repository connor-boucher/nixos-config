{ config, lib, ... }:

{
  options.ranger.enable = lib.mkEnableOption "enables ranger";

  config = lib.mkIf config.ranger.enable {
    programs.ranger = {
      enable = true;

      settings = {
        column_ratios = "1,2,2";
        draw_borders = true;
      };
    };
  };
}
