{ config, lib, ... }:

{
  options.tmux.enable = lib.mkEnableOption "enables tmux";

  config = lib.mkIf config.tmux.enable {
    stylix.targets.tmux.enable = false;

    programs.tmux = {
      enable = true;

      baseIndex = 1;
      clock24 = true;
      keyMode = "vi";
      mouse = true;
      shortcut = "c";
      terminal = "screen-256color";

      extraConfig = ''
        setw -g automatic-rename on
        set -g renumber-windows on
        set -g status-style bg=default

        # Custom bindings
        bind C-c send-prefix
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R
      '';
    };
  };
}
