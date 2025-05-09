{ config, lib, ... }:

{
  options.gtk.enable = lib.mkEnableOption "enables gtk";

  config = lib.mkIf config.gtk.enable {
    gtk.enable = true;
  };
}
