{ config, lib, ... }:

{
  options.video.mpv.enable = lib.mkEnableOption "enables mpv";

  config = lib.mkIf config.video.mpv.enable {
    programs.mpv.enable = true;
  };
}
