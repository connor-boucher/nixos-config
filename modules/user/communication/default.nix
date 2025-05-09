{ config, lib, ... }:

{
  imports = [
    ./vencord
  ];

  options.communication.enable = lib.mkEnableOption "enable communication";

  config = lib.mkIf config.communication.enable {
    communication = {
      vencord.enable = lib.mkDefault true;
    };
  };
}
