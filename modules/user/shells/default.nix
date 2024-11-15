{ config, lib, ... }:

{
  imports = [
    ./nushell
    ./zsh
  ];

  options.shells.enable = lib.mkEnableOption "enable shells";

  config = lib.mkIf config.shells.enable {
    nushell.enable = lib.mkDefault false;
    zsh.enable = lib.mkDefault true;
  };
}
