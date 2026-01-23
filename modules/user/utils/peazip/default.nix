{ config, lib, pkgs, ... }:

{
  options.utils.peazip.enable = lib.mkEnableOption "enables peazip";

  config = lib.mkIf config.utils.peazip.enable {
    home.packages = [ pkgs.peazip ];
  };
}
