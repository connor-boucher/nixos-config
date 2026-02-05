{ config, lib, pkgs, ... }:

{
  options.dev.nix.enable = lib.mkEnableOption "enables nix";

  config = lib.mkIf config.dev.nix.enable {
    home.packages = with pkgs; [
      nixd
      nixpkgs-fmt
    ];
  };
}
