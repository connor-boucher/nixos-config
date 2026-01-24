{ config, lib, ... }:

{
  imports = [
    ./mpv
    ./stremio
  ];

  options.video.enable = lib.mkEnableOption "enable video";

  config = lib.mkIf config.video.enable {
    video = {
      mpv.enable = true;
      stremio.enable = lib.mkDefault false;
    };
  };
}
