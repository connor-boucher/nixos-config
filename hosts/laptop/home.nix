{ config, pkgs, ... }:

{
  imports = [
    ../../modules/user/dev
    ../../modules/user/editors
    ../../modules/user/music
    ../../modules/user/shells
    ../../modules/user/terminals
    ../../modules/user/window-managers
  ];

  home.username = "connor";
  home.homeDirectory = "/home/connor";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  # User software
  dev.enable = true;
  editors.enable = true;
  music.enable = true;
  shells.enable = true;
  terminals.enable = true;
  window-managers.enable = true;

  home.packages = with pkgs; [ brave discord nitch pulsemixer protonvpn-gui ];

  home.stateVersion = "23.11";
}