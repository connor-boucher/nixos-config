{ my, ... }:

{
  imports = [
    ../modules/user/appearance
    ../modules/user/browsers
    ../modules/user/communication
    ../modules/user/dev
    ../modules/user/editors
    ../modules/user/music
    ../modules/user/networking
    ../modules/user/shells
    ../modules/user/terminals
    ../modules/user/utils
    ../modules/user/video
    ../modules/user/window-managers
  ];

  # Configure user settings
  home = {
    username = my.user.username;
    homeDirectory = my.user.home;
  };

  # Enable home manager
  programs.home-manager.enable = true;

  # User software modules
  appearance.enable = true;
  browsers.enable = true;
  communication.enable = true;
  dev.enable = true;
  editors.enable = true;
  music.enable = true;
  networking.enable = true;
  shells.enable = true;
  terminals.enable = true;
  utils.enable = true;
  video.enable = true;
  window-managers.enable = true;

  home.stateVersion = "23.11";
}
