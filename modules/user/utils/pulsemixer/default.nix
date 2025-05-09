{ config, lib, pkgs, ... }:

{
  options.utils.pulsemixer.enable = lib.mkEnableOption "enables pulsemixer";

  config = lib.mkIf config.utils.pulsemixer.enable {
    home.packages = [ pkgs.pulsemixer ];
  };
}
