{ config, lib, ... }:

{
  imports = [
    ./foot
  ];

  options.terminals.enable = lib.mkEnableOption "enable terminals";

  config = lib.mkIf config.terminals.enable {
    foot.enable = lib.mkDefault true;
  };
}
