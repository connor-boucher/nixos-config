{ config, lib, ... }:

{
  options.shells.zsh.enable = lib.mkEnableOption "enables zsh";

  config = lib.mkIf config.shells.zsh.enable {
    programs.zsh = {
      enable = true;

      # Move config files out of ~
      dotDir = "${config.xdg.configHome}/zsh";

      # Set custom prompt
      initContent = ''
        autoload -U colors && colors
        PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
      '';

      # Enable vi mode
      defaultKeymap = "viins";

      # Configuration settings
      autocd = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      autosuggestion.strategy = [ "history" "completion" ];
      syntaxHighlighting.enable = true;

      # Fish-style abbreviations
      zsh-abbr.enable = true;
      zsh-abbr.abbreviations = {
        top = "btop";
        ls = "eza";
        g = "git";
      };
    };
  };
}
