{ config, lib, ... }:

{
  imports = [
    ./nh
    ./ranger
    ./waybar
  ];

  options.utils.enable = lib.mkEnableOption "enable utils";

  config = lib.mkIf config.utils.enable {
    nh.enable = lib.mkDefault true;
    ranger.enable = lib.mkDefault true;
    waybar.enable = lib.mkDefault true;
  };
}
