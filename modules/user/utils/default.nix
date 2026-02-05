{ config, lib, ... }:

{
  imports = [
    ./btop
    ./dolphin
    ./eza
    ./fuzzel
    ./fzf
    ./git
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
    ./zathura
    ./zip
  ];

  options.utils.enable = lib.mkEnableOption "enable utils";

  config = lib.mkIf config.utils.enable {
    utils = {
      btop.enable = lib.mkDefault true;
      dolphin.enable = lib.mkDefault true;
      eza.enable = lib.mkDefault true;
      fuzzel.enable = lib.mkDefault false;
      fzf.enable = lib.mkDefault true;
      git.enable = lib.mkDefault true;
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
      zathura.enable = lib.mkDefault true;
      zip.enable = lib.mkDefault true;
    };
  };
}
