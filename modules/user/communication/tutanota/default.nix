{ config, lib, pkgs, ... }:

{
  options.communication.tutanota.enable = lib.mkEnableOption "enables tutanota";

  config = lib.mkIf config.communication.tutanota.enable {
    home.packages = [ pkgs.tutanota-desktop ];
  };
}
