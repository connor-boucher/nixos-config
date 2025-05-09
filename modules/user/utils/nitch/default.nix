{ config, lib, pkgs, ... }:

{
  options.utils.nitch.enable = lib.mkEnableOption "enables nitch";

  config = lib.mkIf config.utils.nitch.enable {
    home.packages = [ pkgs.nitch ];
  };
}
