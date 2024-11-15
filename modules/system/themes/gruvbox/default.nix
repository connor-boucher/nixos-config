{ config, lib, pkgs, ... }:

{
  options.gruvbox.enable = lib.mkEnableOption "enables gruvbox";

  config = {
    stylix = lib.mkIf config.gruvbox.enable {
      enable = true;

      # Enable gruvbox colourscheme
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
      image = ./wallpaper.png;

      # Set transparency for terminals
      opacity.terminal = 0.95;

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
