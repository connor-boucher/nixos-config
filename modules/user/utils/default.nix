{ config, lib, ... }:

{
  imports = [
    ./lf
    ./nh
    ./ranger
    ./waybar
  ];

  options.utils.enable = lib.mkEnableOption "enable utils";

  config = lib.mkIf config.utils.enable {
    lf.enable = lib.mkDefault true;
    nh.enable = lib.mkDefault true;
    ranger.enable = lib.mkDefault false;
    waybar.enable = lib.mkDefault true;
  };
}
