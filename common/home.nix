{ my, pkgs, ... }:

{
  imports = [
    ../modules/user/browsers
    ../modules/user/communication
    ../modules/user/dev
    ../modules/user/editors
    ../modules/user/music
    ../modules/user/networking
    ../modules/user/shells
    ../modules/user/terminals
    ../modules/user/utils
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
  browsers.enable = true;
  communication.enable = true;
  dev.enable = true;
  editors.enable = true;
  music.enable = true;
  networking.enable = true;
  shells.enable = true;
  terminals.enable = true;
  utils.enable = true;
  window-managers.enable = true;

  gtk.enable = true;
  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.iconTheme.name = "Papirus Dark";
  dconf.settings = {
    "org/mate/destkop/background" = {
      picture-filename = "" + my.theme.wallpaper;
    };
    "org/mate/desktop/interface" = {
      gtk-theme = "adw-gtk3";
    };
    "org/mate/power-manager" = {
      backlight-battery-reduce = false;
      kbd-backlight-battery-reduce = false;
      idle-dim-battery = false;
    };
  };

  home.stateVersion = "23.11";
}
