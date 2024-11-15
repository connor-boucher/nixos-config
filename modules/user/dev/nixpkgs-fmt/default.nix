{ config, lib, pkgs, ... }:

{
  options.nixpkgs-fmt.enable = lib.mkEnableOption "enables nixpkgs-fmt";

  config = {
    home.packages = lib.mkIf config.nixpkgs-fmt.enable [ pkgs.nixpkgs-fmt ];
  };
}
