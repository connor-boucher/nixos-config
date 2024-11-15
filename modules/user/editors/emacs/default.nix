{ config, lib, ... }:

{
  options.emacs.enable = lib.mkEnableOption "enables emacs";

  config = {
    programs.emacs = lib.mkIf config.emacs.enable {
      enable = true;
    };

    # Copy dotfiles to ~/.config
    home.file.".config/emacs" = lib.mkIf config.emacs.enable {
      source = ../../../../config/emacs;
      recursive = true;
    };
  };
}
