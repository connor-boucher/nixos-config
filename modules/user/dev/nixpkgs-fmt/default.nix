{ config, lib, pkgs, ... }:

{
  options.nixpkgs-fmt.enable = lib.mkEnableOption "enables nixpkgs-fmt";

  config = lib.mkIf config.nixpkgs-fmt.enable {
    home.packages = [ pkgs.nixpkgs-fmt ];
  };
}
