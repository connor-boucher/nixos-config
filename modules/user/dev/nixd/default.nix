{ config, lib, pkgs, ... }:

{
  options.dev.nixd.enable = lib.mkEnableOption "enables nixd";

  config = lib.mkIf config.dev.nixd.enable {
    home.packages = [ pkgs.nixd ];
  };
}
