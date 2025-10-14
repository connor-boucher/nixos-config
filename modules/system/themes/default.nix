{ config, pkgs, ... }:

{
  config.stylix = {
    enable = true;

    # Enable custom colour scheme
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${config.my.theme.base16Scheme}.yaml";

    # Set wallpaper
    image = config.my.theme.wallpaper;
    polarity = config.my.theme.polarity;

    # Set transparency for applications
    opacity.applications = 0.95;
    opacity.terminal = 0.95;

    # Set custom cursor
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    # Set custom fonts
    fonts.monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };
  };
}
