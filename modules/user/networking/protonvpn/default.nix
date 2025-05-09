{ config, lib, pkgs, ... }:

{
  options.networking.protonvpn.enable = lib.mkEnableOption "enables protonvpn";

  config = lib.mkIf config.networking.protonvpn.enable {
    home.packages = with pkgs; [
      protonvpn-cli
      protonvpn-gui
    ];
  };
}
