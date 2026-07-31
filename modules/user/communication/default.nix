{ config, lib, ... }:

{
  imports = [
    ./discord
    ./tutanota
  ];

  options.communication.enable = lib.mkEnableOption "enable communication";

  config = lib.mkIf config.communication.enable {
    communication = {
      discord.enable = lib.mkDefault true;
      tutanota.enable = lib.mkDefault true;
    };
  };
}
