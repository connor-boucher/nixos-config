{ config, lib, pkgs, ... }:

{
  options.nitch.enable = lib.mkEnableOption "enables nitch";

  config = lib.mkIf config.nitch.enable {
    home.packages = [ pkgs.nitch ];
  };
}
