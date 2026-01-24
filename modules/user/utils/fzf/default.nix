{ config, lib, ... }:

{
  options.utils.fzf.enable = lib.mkEnableOption "enables fzf";

  config = lib.mkIf config.utils.fzf.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
