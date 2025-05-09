{ config, lib, pkgs, ... }:

{
  options.dev.nixpkgs-fmt.enable = lib.mkEnableOption "enables nixpkgs-fmt";

  config = lib.mkIf config.dev.nixpkgs-fmt.enable {
    home.packages = [ pkgs.nixpkgs-fmt ];
  };
}
