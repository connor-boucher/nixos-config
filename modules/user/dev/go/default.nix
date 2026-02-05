{ config, lib, ... }:

{
  options.dev.go.enable = lib.mkEnableOption "enables go";

  config = lib.mkIf config.dev.go.enable {
    programs.go.enable = true;
  };
}
