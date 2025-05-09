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
  spicetify = {
    theme = inputs.spicetify-nix.legacyPackages.${pkgs.system}.themes.text;
    colorScheme = "rosepine";
  };
  zed = {
    theme = {
      pkg = "rose-pine-theme";
      light = "Rosé Pine Dawn";
      dark = "Rosé Pine";
    };
  };
}
