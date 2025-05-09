{ config, lib, ... }:

{
  options.editors.emacs.enable = lib.mkEnableOption "enables emacs";

  config = lib.mkIf config.editors.emacs.enable {
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
