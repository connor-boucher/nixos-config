{ config, lib, pkgs, ... }:

{
  options.vencord.enable = lib.mkEnableOption "enables vencord";

  config = lib.mkIf config.vencord.enable {
    home.packages = [
      (pkgs.discord.override {
        withOpenASAR = true;
        withVencord = true;
      })
    ];
  };
}
