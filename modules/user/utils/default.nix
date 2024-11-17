{ config, lib, ... }:

{
  imports = [
    ./waybar
  ];

  options.utils.enable = lib.mkEnableOption "enable utils";

  config = lib.mkIf config.utils.enable {
    waybar.enable = lib.mkDefault true;
  };
}
