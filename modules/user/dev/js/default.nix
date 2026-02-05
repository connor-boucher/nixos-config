{ config, lib, ... }:

{
  options.dev.js.enable = lib.mkEnableOption "enables js";

  config = lib.mkIf config.dev.js.enable {
    programs.bun.enable = true;
  };
}
