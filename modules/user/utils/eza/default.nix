{ config, lib, ... }:

{
  options.utils.eza.enable = lib.mkEnableOption "enables eza";

  config = lib.mkIf config.utils.eza.enable {
    programs.eza.enable = true;
  };
}
