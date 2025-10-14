{ inputs, pkgs, ... }:

{
  name = "rose-pine";
  polarity = "dark";
  wallpaper = ./wallpaper.jpg;
  base16Scheme = "rose-pine";
  icons = {
    name = "rose-pine";
    package = pkgs.rose-pine-icon-theme;
  };
  nixcord = {
    theme = "https://github.com/refact0r/system24/blob/main/theme/flavors/system24-rose-pine.theme.css";
  };
  spicetify = {
    theme = inputs.spicetify-nix.legacyPackages.${pkgs.system}.themes.text;
    colorScheme = "RosePine";
  };
  zed = {
    theme = {
      pkg = "rose-pine-theme";
      light = "Rosé Pine Dawn";
      dark = "Rosé Pine";
    };
  };
}
