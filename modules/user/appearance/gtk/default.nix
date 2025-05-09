{ config, lib, my, pkgs, ... }:

{
  options.appearance.gtk.enable = lib.mkEnableOption "enables gtk";

  config = lib.mkIf config.appearance.gtk.enable {
    gtk = {
      enable = true;
      iconTheme = my.theme.icons;
    };
  };
}
