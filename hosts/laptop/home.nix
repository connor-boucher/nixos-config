{ my, pkgs, ... }:

{
  imports = [
    ../../modules/user/browsers
    ../../modules/user/communication
    ../../modules/user/dev
    ../../modules/user/editors
    ../../modules/user/music
    ../../modules/user/shells
    ../../modules/user/terminals
    ../../modules/user/utils
    ../../modules/user/window-managers
  ];

  # Configure user settings
  home = {
    username = my.user.username;
    homeDirectory = my.user.home;
  };

  # Enable home manager
  programs.home-manager.enable = true;

  # User software modules
  browsers.enable = true;
  communication.enable = true;
  dev.enable = true;
  editors.enable = true;
  music.enable = true;
  shells.enable = true;
  terminals.enable = true;
  utils.enable = true;
  window-managers.enable = true;

  # TODO modularize
  home.packages = with pkgs; [ nitch pulsemixer protonvpn-gui zed-editor ];

  home.stateVersion = "23.11";
}
