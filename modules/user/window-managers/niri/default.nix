{ config, inputs, lib, my, pkgs, ... }:

{
  imports = [
    inputs.niri.homeModules.niri
    inputs.noctalia.homeModules.default
  ];

  options.window-managers.niri.enable = lib.mkEnableOption "enables niri";

  config = lib.mkIf config.window-managers.niri.enable {
    nixpkgs.overlays = [ inputs.niri.overlays.niri ];

    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;

      settings = {
        prefer-no-csd = true;
        hotkey-overlay.skip-at-startup = true;

        layout = {
          border.enable = false;
          focus-ring = with config.lib.stylix.colors.withHashtag; {
            enable = true;
            width = 2;
            active.color = base0A;
            inactive.color = base03;
          };

          shadow = {
            enable = true;
            spread = 5;
            draw-behind-window = true;
          };

          preset-column-widths = [
            { proportion = 1.0 / 3.0; }
            { proportion = 0.5; }
            { proportion = 2.0 / 3.0; }
          ];

          preset-window-heights = [
            { proportion = 1.0 / 3.0; }
            { proportion = 0.5; }
            { proportion = 2.0 / 3.0; }
            { proportion = 1.0; }
          ];

          default-column-width.proportion = 2.0 / 3.0;
        };

        gestures.hot-corners.enable = false;

        spawn-at-startup = [
          { command = [ "noctalia-shell" ]; }
        ];

        binds =
          with config.lib.niri.actions;
          let
            sh = spawn "sh" "-c";
          in
          {
            "Super+Return".action.spawn = [ "${config.home.sessionVariables.TERMINAL}" ];
            "Super+B".action.spawn = [ "${config.home.sessionVariables.BROWSER}" ];
            "Super+C".action.spawn = [ "qalculate-gtk" ];
            "Super+D".action.spawn = [ "discord" ];
            "Super+E".action.spawn = [ "emacs" ];
            "Super+F".action.spawn = [ "thunar" ];
            "Super+G".action.spawn = [ "steam" ];
            "Super+M".action.spawn = [ "${config.home.sessionVariables.TERMINAL}" "-e" "pulsemixer" ];
            "Super+N".action.spawn = [ "${config.home.sessionVariables.TERMINAL}" "-e" "nmtui" ];
            "Super+S".action.spawn = [ "spotify" ];
            "Super+R".action.spawn = [
              "noctalia-shell"
              "ipc"
              "call"
              "launcher"
              "toggle"
            ];

            "Super+Shift+C".action = close-window;
            "Super+Shift+P".action.spawn = [
              "noctalia-shell"
              "ipc"
              "call"
              "sessionMenu"
              "toggle"
            ];

            "Super+1".action = focus-workspace 1;
            "Super+2".action = focus-workspace 2;
            "Super+3".action = focus-workspace 3;
            "Super+4".action = focus-workspace 4;
            "Super+5".action = focus-workspace 5;
            "Super+6".action = focus-workspace 6;
            "Super+7".action = focus-workspace 7;
            "Super+8".action = focus-workspace 8;
            "Super+9".action = focus-workspace 9;
            "Super+0".action = focus-workspace 10;

            "Super+H".action = focus-column-left;
            "Super+J".action = focus-window-down;
            "Super+K".action = focus-window-up;
            "Super+L".action = focus-column-right;
            "Super+Shift+H".action = move-column-left;
            "Super+Shift+J".action = move-window-down;
            "Super+Shift+K".action = move-window-up;
            "Super+Shift+L".action = move-column-right;

            "Super+Tab".action = toggle-overview;

            "Super+Shift+Right".action = consume-or-expel-window-right;
            "Super+Shift+Left".action = consume-or-expel-window-left;
            "Super+Shift+Up".action = move-window-up-or-to-workspace-up;
            "Super+Shift+Down".action = move-window-down-or-to-workspace-down;
            "Super+Shift+F".action = expand-column-to-available-width;
            "Super+Backslash".action = maximize-column;
            "Super+Shift+Backslash".action = fullscreen-window;
            "Super+Shift+Space".action = toggle-window-floating;
            "Super+Shift+Return".action = move-window-to-monitor-next;
            "Super+Shift+Comma".action = switch-preset-column-width;
            "Super+Shift+Period".action = switch-preset-window-height;
            "Super+Shift+Tab".action = toggle-column-tabbed-display;

            "Print".action.screenshot-screen = { show-pointer = false; };
            "Super+Shift+E".action = quit;
            "XF86PowerOff".action.spawn = [
              "noctalia-shell"
              "ipc"
              "call"
              "sessionMenu"
              "toggle"
            ];

            "XF86AudioPlay".action = sh "playerctl play-pause";
            "XF86AudioStop".action = sh "playerctl stop";
            "XF86AudioPrev".action = sh "playerctl previous";
            "XF86AudioNext".action = sh "playerctl next";

            "XF86AudioRaiseVolume".action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
            "XF86AudioLowerVolume".action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";

            "XF86AudioMute".action = sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            "XF86AudioMicMute".action = sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

            "XF86MonBrightnessUp".action = sh "brightnessctl" "--class=backlight" "set" "+10%";
            "XF86MonBrightnessDown".action = sh "brightnessctl" "--class=backlight" "set" "-10%";
          };

        window-rules = [
          {
            matches = [
              { app-id = "discord"; }
              { app-id = "Emacs"; }
              { app-id = "spotify"; }
            ];
            opacity = config.stylix.opacity.applications;
          }
        ];
      };
    };

    home.packages = with pkgs; [
      inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
    ];

    programs.noctalia-shell = {
      enable = true;

      settings = {
        bar = {
          density = "comfortable";
          opacity = 0.75;
          outerCorners = false;
          widgets = {
            left = [
              {
                id = "Clock";
              }
              {
                id = "ActiveWindow";
              }
              {
                id = "MediaMini";
              }
            ];
            center = [
              {
                id = "Workspace";
                labelMode = "none";
              }
            ];
            right = [
              {
                id = "Tray";
              }
              {
                id = "NotificationHistory";
              }
              {
                id = "WiFi";
              }
              {
                id = "Bluetooth";
              }
              {
                id = "Volume";
              }
              {
                id = "SystemMonitor";
              }
              {
                id = "ControlCenter";
                useDistroLogo = true;
              }
            ];
          };
        };
        ui.fontDefault = lib.mkForce "JetBrainsMono Nerd Font";
      };
    };
  };
}
