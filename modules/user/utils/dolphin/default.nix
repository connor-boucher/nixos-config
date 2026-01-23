{ config, lib, pkgs, ... }:

{
  options.utils.dolphin.enable = lib.mkEnableOption "enables dolphin";

  config = lib.mkIf config.utils.dolphin.enable {
    home.packages = [ pkgs.kdePackages.dolphin ];
  };
}
