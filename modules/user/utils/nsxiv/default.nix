{ config, lib, pkgs, ... }:

{
  options.nsxiv.enable = lib.mkEnableOption "enables nsxiv";

  config = lib.mkIf config.nsxiv.enable {
    home.packages = [ pkgs.nsxiv ];
  };
}
