{ config, lib, ... }:

{
  imports = [
    ./nh
  ];

  options.utils.enable = lib.mkEnableOption "enable utils";

  config = lib.mkIf config.utils.enable {
    nh.enable = lib.mkDefault true;
  };
}
