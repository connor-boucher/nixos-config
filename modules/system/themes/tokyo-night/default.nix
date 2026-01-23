{ inputs, pkgs, ... }:

{
  name = "tokyo-night";
  polarity = "dark";
  wallpaper = ./wallpaper.jpg;
  base16Scheme = "tokyo-night-dark";
  icons = {
    name = "papirus";
    package = pkgs.papirus-icon-theme;
  };
  nixcord = {
    theme = "https://github.com/refact0r/system24/raw/refs/heads/main/theme/flavors/system24-tokyo-night.theme.css";
  };
  spicetify = {
    theme = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system}.themes.text;
    colorScheme = "TokyoNight";
  };
  zed = {
    theme = {
      pkg = "tokyo-night-themes";
      light = "Tokyo Night Light";
      dark = "Tokyo Night";
    };
  };
}
