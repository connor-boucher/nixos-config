{ config, lib, pkgs, ... }:

{
  options.gruvbox.enable = lib.mkEnableOption "enables gruvbox";

  config = {
    stylix = lib.mkIf config.gruvbox.enable {
      enable = true;

      # Enable gruvbox colourscheme
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

      # Set wallpaper
      image = ./wallpaper.jpg;
      polarity = "dark";

      # Set transparency for applications
      opacity.terminal = 0.95;

      # Set custom cursor
      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
      };

      # Set custom fonts
      fonts.monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
    };
  };
}
