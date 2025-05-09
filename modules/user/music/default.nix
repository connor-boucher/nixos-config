{ config, lib, ... }:

{
  imports = [
    ./spicetify
  ];

  options.music.enable = lib.mkEnableOption "enable music";

  config = lib.mkIf config.dev.enable {
    music = {
      spicetify.enable = lib.mkDefault true;
    };
  };
}
