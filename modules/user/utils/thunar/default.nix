{ config, lib, pkgs, ... }:

{
  options.utils.thunar.enable = lib.mkEnableOption "enables thunar";

  config = lib.mkIf config.utils.thunar.enable {
    home.packages = [ pkgs.xfce.thunar ];
  };
}
