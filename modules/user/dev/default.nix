{ config, lib, ... }:

{
  imports = [
    ./git
    ./nixpkgs-fmt
  ];

  options.dev.enable = lib.mkEnableOption "enable dev";

  config = lib.mkIf config.dev.enable {
    git.enable = lib.mkDefault true;
    nixpkgs-fmt.enable = lib.mkDefault true;
  };
}