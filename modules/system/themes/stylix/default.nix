{ config, lib, pkgs, ... }:

{
  options.stylx.enable = lib.mkEnableOption "enables stylix";

  config = {
    stylix = lib.mkIf config.stylx.enable {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
      image = ./wallpaper.png;
      opacity.terminal = 0.95;
    };
  };
}
