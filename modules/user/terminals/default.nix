{ config, lib, ... }:

{
  imports = [
    ./foot
  ];

  options.terminals.enable = lib.mkEnableOption "enable terminals";

  config = lib.mkIf config.terminals.enable {
    home.sessionVariables.TERMINAL = lib.mkDefault "foot";

    terminals = {
      foot.enable = lib.mkDefault true;
    };
  };
}
