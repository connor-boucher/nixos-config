{ config, lib, pkgs, ... }:

{
  options.protonvpn.enable = lib.mkEnableOption "enables protonvpn";

  config = lib.mkIf config.protonvpn.enable {
    home.packages = with pkgs; [
      protonvpn-cli
      protonvpn-gui
    ];
  };
}
