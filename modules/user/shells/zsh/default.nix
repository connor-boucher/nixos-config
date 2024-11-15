{ config, lib, ... }:

{
  options.zsh.enable = lib.mkEnableOption "enables zsh";

  config = {
    programs.zsh = lib.mkIf config.zsh.enable {
      enable = true;
    };
  };
}
