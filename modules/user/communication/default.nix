{ config, lib, ... }:

{
  imports = [
    ./nixcord
  ];

  options.communication.enable = lib.mkEnableOption "enable communication";

  config = lib.mkIf config.communication.enable {
    communication = {
      nixcord.enable = lib.mkDefault true;
    };
  };
}
