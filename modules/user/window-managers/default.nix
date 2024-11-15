{ config, lib, ... }:

{
  imports = [
    ./hyprland
    ./sway
  ];

  options.window-managers.enable = lib.mkEnableOption "enable window-managers";

  config = lib.mkIf config.window-managers.enable {
    hyprland.enable = lib.mkDefault false;
    sway.enable = lib.mkDefault true;
  };
}
