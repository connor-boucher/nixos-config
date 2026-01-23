{ config, lib, pkgs, ... }:

{
  options.utils.pv.enable = lib.mkEnableOption "enables pv";

  config = lib.mkIf config.utils.pv.enable {
    home.packages = [ pkgs.pv ];
  };
}
