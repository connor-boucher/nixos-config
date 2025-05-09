{ config, lib, ... }:

{
  options.utils.fuzzel.enable = lib.mkEnableOption "enables fuzzel";

  config = lib.mkIf config.utils.fuzzel.enable {
    programs.fuzzel.enable = true;
  };
}
