{ config, lib, ... }:

{
  imports = [
    ./qutebrowser
  ];

  options.browsers.enable = lib.mkEnableOption "enable browsers";

  config = lib.mkIf config.browsers.enable {
    qutebrowser.enable = lib.mkDefault true;
  };
}
