{ config, lib, ... }:

{
  imports = [
    ./protonvpn
  ];

  options.networking.enable = lib.mkEnableOption "enable networking";

  config = lib.mkIf config.networking.enable {
    protonvpn.enable = lib.mkDefault true;
  };
}
