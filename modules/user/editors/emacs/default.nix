{ config, lib, ... }:

{
  options.emacs.enable = lib.mkEnableOption "enables emacs";

  config = lib.mkIf config.emacs.enable {
    programs.emacs = {
      enable = true;
    };

    # Copy dotfiles to ~/.config
    home.file.".config/emacs" = {
      source = ./config;
      recursive = true;
    };
  };
}
