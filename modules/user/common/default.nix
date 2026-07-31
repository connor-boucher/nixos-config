{ config, lib, ... }:

{
  imports = [
    ./xdg
  ];

  options.common.enable = lib.mkEnableOption "enable common";

  config = lib.mkIf config.common.enable {
    common = {
      xdg.enable = lib.mkDefault true;
    };
  };
}
