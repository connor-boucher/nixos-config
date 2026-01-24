{ config, lib, ... }:

{
  options.utils.btop.enable = lib.mkEnableOption "enables btop";

  config = lib.mkIf config.utils.btop.enable {
    programs.btop.enable = true;
  };
}
