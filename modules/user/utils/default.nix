{ config, lib, ... }:

{
  imports = [
    ./dolphin
    ./fuzzel
    ./lf
    ./nh
    ./nitch
    ./nsxiv
    ./peazip
    ./pulsemixer
    ./pv
    ./ranger
    ./tmux
    ./waybar
  ];

  options.utils.enable = lib.mkEnableOption "enable utils";

  config = lib.mkIf config.utils.enable {
    utils = {
      dolphin.enable = lib.mkDefault true;
      fuzzel.enable = lib.mkDefault true;
      lf.enable = lib.mkDefault true;
      nh.enable = lib.mkDefault true;
      nitch.enable = lib.mkDefault true;
      nsxiv.enable = lib.mkDefault true;
      peazip.enable = lib.mkDefault true;
      pulsemixer.enable = lib.mkDefault true;
      pv.enable = lib.mkDefault true;
      ranger.enable = lib.mkDefault false;
      tmux.enable = lib.mkDefault true;
      waybar.enable = lib.mkDefault true;
    };
  };
}
