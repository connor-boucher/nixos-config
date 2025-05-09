{ config, lib, ... }:

{
  imports = [
    ./dconf
    ./gtk
  ];

  options.appearance.enable = lib.mkEnableOption "enable appearance";

  config = lib.mkIf config.appearance.enable {
    appearance = {
      dconf.enable = lib.mkDefault true;
      gtk.enable = lib.mkDefault true;
    };
  };
}
