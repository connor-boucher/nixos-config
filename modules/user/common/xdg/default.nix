{ config, lib, pkgs, ... }:

{
  options.common.xdg.enable = lib.mkEnableOption "enables xdg";

  config = lib.mkIf config.common.xdg.enable {
    xdg = {
        # Change user directory names
        userDirs = {
            enable = true;
            createDirectories = true;
            desktop = "$HOME/desktop";
            download = "$HOME/downloads";
            documents = "$HOME/documents";
            music = "$HOME/music";
            pictures = "$HOME/pictures";
            videos = "$HOME/videos";
            templates = null;
            publicShare = null;
        };

        portal = {
            enable = true;
            extraPortals = with pkgs; [
                xdg-desktop-portal-gtk
            ];
        };
    };
  };
}
