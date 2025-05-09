{ config, lib, pkgs, ... }:

{
  options.window-managers.sway.enable = lib.mkEnableOption "enables sway";

  config = lib.mkIf config.window-managers.sway.enable {
    wayland.windowManager.sway = {
      enable = true;

      config = rec {
        # Set the modifier key
        modifier = "Mod4";

        # Custom keybindings
        keybindings = lib.mkBefore {
          # User software
          "${modifier}+Return" = "exec foot";
          "${modifier}+b" = "exec brave";
          "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run";

          # Focus windows
          "${modifier}+h" = "focus left";
          "${modifier}+j" = "focus down";
          "${modifier}+k" = "focus up";
          "${modifier}+l" = "focus right";
          "${modifier}+Left" = "focus left";
          "${modifier}+Down" = "focus down";
          "${modifier}+Up" = "focus up";
          "${modifier}+Right" = "focus right";

          # Move windows
          "${modifier}+Shift+h" = "move left";
          "${modifier}+Shift+j" = "move down";
          "${modifier}+Shift+k" = "move up";
          "${modifier}+Shift+l" = "move right";
          "${modifier}+Shift+Left" = "move left";
          "${modifier}+Shift+Down" = "move down";
          "${modifier}+Shift+Up" = "move up";
          "${modifier}+Shift+Right" = "move right";

          # Resize windows
          "${modifier}+r" = "mode resize";

          # Layout bindings
          "${modifier}+n" = "splith";
          "${modifier}+v" = "splitv";
          "${modifier}+f" = "fullscreen toggle";
          "${modifier}+a" = "focus parent";
          "${modifier}+s" = "layout stacking";
          "${modifier}+w" = "layout tabbed";
          "${modifier}+e" = "layout toggle split";
          "${modifier}+space" = "focus mode_toggle";
          "${modifier}+Shift+space" = "floating toggle";

          # Swap to workspaces
          "${modifier}+1" = "workspace number 1";
          "${modifier}+2" = "workspace number 2";
          "${modifier}+3" = "workspace number 3";
          "${modifier}+4" = "workspace number 4";
          "${modifier}+5" = "workspace number 5";
          "${modifier}+6" = "workspace number 6";
          "${modifier}+7" = "workspace number 7";
          "${modifier}+8" = "workspace number 8";
          "${modifier}+9" = "workspace number 9";
          "${modifier}+0" = "workspace number 10";

          # Move window to workspace
          "${modifier}+Shift+1" = "move container to workspace number 1";
          "${modifier}+Shift+2" = "move container to workspace number 2";
          "${modifier}+Shift+3" = "move container to workspace number 3";
          "${modifier}+Shift+4" = "move container to workspace number 4";
          "${modifier}+Shift+5" = "move container to workspace number 5";
          "${modifier}+Shift+6" = "move container to workspace number 6";
          "${modifier}+Shift+7" = "move container to workspace number 7";
          "${modifier}+Shift+8" = "move container to workspace number 8";
          "${modifier}+Shift+9" = "move container to workspace number 9";
          "${modifier}+Shift+0" = "move container to workspace number 10";

          # Scratchpad bindings
          "${modifier}+minus" = "scratchpad show";
          "${modifier}+Shift+minus" = "move scratchpad";

          # Sway bindings
          "${modifier}+Shift+c" = "kill";
          "${modifier}+Shift+r" = "reload";
          "${modifier}+Shift+q" = "exit";
        };

        # Window gaps
        gaps.inner = 10;

        # Window titlebars
        window.titlebar = false;
      };
    };
  };
}
