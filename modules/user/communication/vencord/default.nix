{ config, lib, pkgs, ... }:

{
  options.communication.vencord.enable = lib.mkEnableOption "enables vencord";

  config = lib.mkIf config.communication.vencord.enable {
    home.packages = [
      (pkgs.discord.override {
        withOpenASAR = true;
        withVencord = true;
      })
    ];
  };
}
