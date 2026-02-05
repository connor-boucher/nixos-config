{ config, lib, pkgs, ... }:

{
  options.dev.rust.enable = lib.mkEnableOption "enables rust";

  config = lib.mkIf config.dev.rust.enable {
    home.packages = with pkgs; [
      cargo
      rustc
    ];
  };
}
