{ config, lib, ... }:

{
  imports = [
    ./nh
    ./waybar
  ];

  options.utils.enable = lib.mkEnableOption "enable utils";

  config = lib.mkIf config.utils.enable {
    nh.enable = lib.mkDefault true;
    waybar.enable = lib.mkDefault true;
  };
}
