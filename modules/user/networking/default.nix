{ config, lib, ... }:

{
  imports = [
    ./protonvpn
  ];

  options.networking.enable = lib.mkEnableOption "enable networking";

  config = lib.mkIf config.networking.enable {
    networking = {
      protonvpn.enable = lib.mkDefault true;
    };
  };
}
