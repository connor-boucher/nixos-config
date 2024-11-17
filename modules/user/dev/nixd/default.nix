{ config, lib, pkgs, ... }:

{
  options.nixd.enable = lib.mkEnableOption "enables nixd";

  config = lib.mkIf config.nixd.enable {
    home.packages = [ pkgs.nixd ];
  };
}
