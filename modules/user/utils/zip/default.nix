{ config, lib, pkgs, ... }:

{
  options.utils.zip.enable = lib.mkEnableOption "enables zip";

  config = lib.mkIf config.utils.zip.enable {
    home.packages = [ pkgs.zip ];
  };
}
