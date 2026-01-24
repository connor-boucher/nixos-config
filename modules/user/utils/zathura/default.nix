{ config, lib, ... }:

{
  options.utils.zathura.enable = lib.mkEnableOption "enables zathura";

  config = lib.mkIf config.utils.zathura.enable {
    programs.zathura.enable = true;
  };
}
