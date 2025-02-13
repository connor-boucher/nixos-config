{ config, lib, ... }:

{
  options.zsh.enable = lib.mkEnableOption "enables zsh";

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;

      # Move config files out of ~
      dotDir = ".config/zsh";

      # Set custom prompt
      initExtra = ''
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
        g = "git";
      };
    };
  };
}
