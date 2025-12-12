{ config, lib, pkgs, ... }:

{
  options.video.stremio.enable = lib.mkEnableOption "enables stremio";

  config = lib.mkIf config.video.stremio.enable {
    home.packages = [ pkgs.stremio ];
  };
}
