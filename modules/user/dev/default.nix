{ config, lib, ... }:

{
  imports = [
    ./git
    ./nixd
    ./nixpkgs-fmt
  ];

  options.dev.enable = lib.mkEnableOption "enable dev";

  config = lib.mkIf config.dev.enable {
    dev = {
      git.enable = lib.mkDefault true;
      nixd.enable = lib.mkDefault true;
      nixpkgs-fmt.enable = lib.mkDefault true;
    };
  };
}
