{ config, lib, ... }:

{
  imports = [
    ./go
    ./js
    ./nix
  ];

  options.dev.enable = lib.mkEnableOption "enable dev";

  config = lib.mkIf config.dev.enable {
    dev = {
      go.enable = lib.mkDefault true;
      js.enable = lib.mkDefault true;
      nix.enable = lib.mkDefault true;
    };
  };
}
