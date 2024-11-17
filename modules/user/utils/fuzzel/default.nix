{ config, lib, ... }:

{
  options.fuzzel.enable = lib.mkEnableOption "enables fuzzel";

  config = lib.mkIf config.fuzzel.enable {
    programs.fuzzel.enable = true;
  };
}
