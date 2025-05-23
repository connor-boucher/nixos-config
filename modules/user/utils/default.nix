{ config, lib, ... }:

{
  imports = [
    ./fuzzel
    ./lf
    ./nh
    ./nitch
    ./nsxiv
    ./pulsemixer
    ./ranger
    ./tmux
    ./waybar
  ];

  options.utils.enable = lib.mkEnableOption "enable utils";

  config = lib.mkIf config.utils.enable {
    utils = {
      fuzzel.enable = lib.mkDefault true;
      lf.enable = lib.mkDefault true;
      nh.enable = lib.mkDefault true;
      nitch.enable = lib.mkDefault true;
      nsxiv.enable = lib.mkDefault true;
      pulsemixer.enable = lib.mkDefault true;
      ranger.enable = lib.mkDefault false;
      tmux.enable = lib.mkDefault true;
      waybar.enable = lib.mkDefault true;
    };
  };
}
