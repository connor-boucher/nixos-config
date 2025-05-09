{ config, lib, pkgs, ... }:

{
  options.utils.nsxiv.enable = lib.mkEnableOption "enables nsxiv";

  config = lib.mkIf config.utils.nsxiv.enable {
    home.packages = [ pkgs.nsxiv ];
  };
}
