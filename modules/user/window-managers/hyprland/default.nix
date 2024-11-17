{ config, inputs, lib, pkgs, ... }:

{
  options.hyprland.enable = lib.mkEnableOption "enables hyprland";

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;

      # Utilise the hyprland flake
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;

      settings = {
        # Set modifier key to Mod4
        "$mod" = "SUPER";

        # Custom keybindings
        bind = [
          "$mod, B, exec, ${config.home.sessionVariables.BROWSER}"
          "$mod, RETURN, exec, ${config.home.sessionVariables.TERMINAL}"
          "$mod, f, exec, ${config.home.sessionVariables.TERMINAL} -e ${pkgs.lf}/bin/lf"

          "$mod, h, movefocus, l"
          "$mod, j, movefocus, d"
          "$mod, k, movefocus, u"
          "$mod, l, movefocus, r"

          "$mod SHIFT, h, movewindow, l"
          "$mod SHIFT, j, movewindow, d"
          "$mod SHIFT, k, movewindow, u"
          "$mod SHIFT, l, movewindow, r"

          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"

          "$mod SHIFT, 1, movetoworkspacesilent, 1"
          "$mod SHIFT, 2, movetoworkspacesilent, 2"
          "$mod SHIFT, 3, movetoworkspacesilent, 3"
          "$mod SHIFT, 4, movetoworkspacesilent, 4"
          "$mod SHIFT, 5, movetoworkspacesilent, 5"
          "$mod SHIFT, 6, movetoworkspacesilent, 6"

          "$mod Shift, C, killactive"
          "$mod Shift, V, togglefloating"
          "$mod Shift, Q, exit"
        ];

        # Monitor configurations
        monitor = [ "eDP-1, 1920x1080, 0x0, 1" ];

        exec-once = [
          "waybar &"
        ];

        animations = {
          animation = [
            "windows, 1, 4, default, slide"
            "border, 1, 5, default"
            "fade, 1, 5, default"
            "workspaces, 1, 3, default"
          ];
        };

        general = {
          gaps_in = 5;
          gaps_out = 10;
        };

        decoration = {
          rounding = 8;
          shadow.enabled = true;
        };

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };
      };
    };
  };
}
