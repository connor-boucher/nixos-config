{ config, lib, ... }:

{
  imports = [
    ./stremio
  ];

  options.video.enable = lib.mkEnableOption "enable video";

  config = lib.mkIf config.video.enable {
    video = {
      stremio.enable = lib.mkDefault false;
    };
  };
}
