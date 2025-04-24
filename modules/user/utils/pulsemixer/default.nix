{ config, lib, pkgs, ... }:

{
  options.pulsemixer.enable = lib.mkEnableOption "enables pulsemixer";

  config = lib.mkIf config.pulsemixer.enable {
    home.packages = [ pkgs.pulsemixer ];
  };
}
