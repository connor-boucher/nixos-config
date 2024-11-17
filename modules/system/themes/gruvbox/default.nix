{ config, lib, pkgs, ... }:

{
  options.gruvbox.enable = lib.mkEnableOption "enables gruvbox";

  config = {
    stylix = lib.mkIf config.gruvbox.enable {
      enable = true;

      # Enable gruvbox colourscheme
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
      image = ./wallpaper.jpg;
      polarity = "dark";

      # Set transparency for applications
      opacity.desktop = 0.95;
      opacity.terminal = 0.95;

      # Set custom cursor
      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
      };

      # Set custom fonts
      fonts = {
        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };

        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };

        monospace = {
          package = pkgs.jetbrains-mono;
          name = "JetBrains Mono";
        };

        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };
      };
    };
  };
}
