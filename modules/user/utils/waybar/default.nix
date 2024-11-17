{ config, lib, ... }:

{
  options.waybar.enable = lib.mkEnableOption "enables waybar";

  config = lib.mkIf config.waybar.enable {
    stylix.targets.waybar.enable = false;

    programs.waybar = {
      enable = true;

      settings = {
        mainBar = {
          # Show above all else
          layer = "top";

          # Size and position
          height = 36;
          margin-top = 10;
          margin-right = 10;
          margin-bottom = 0;
          margin-left = 10;

          # Bar left side
          modules-left = [
            "custom/icon"
            "custom/separator"
            "cpu"
            "memory"
            "temperature"
            "hyprland/window"
          ];

          # Bar middle
          modules-center = [
            "hyprland/workspaces"
          ];

          # Bar right side
          modules-right = [
            "battery"
            "backlight"
            "pulseaudio"
            "custom/right-arrow"
            "network"
            "custom/right-arrow"
            "clock"
            "tray"
          ];

          # Custom widgets
          "custom/icon".format = "";
          "custom/separator".format = " ";
          "custom/right-arrow".format = "";

          # Bar left side modules
          cpu = {
            format = "  {usage}%";
            format-alt = "  {avg_frequency} GHz";
            interval = 2;
          };

          memory = {
            format = "  {}%";
            interval = 2;
          };

          temperature = {
            critical-threshold = 40;
            format = "{icon} {temperatureC}°C";
            format-critical = "{icon} {temperatureC}°C";
            format-icons = [
              ""
              ""
              ""
            ];
            interval = 2;
          };

          "hyprland/window" = {
            format = "<b>{}</b>";
            separate-outputs = true;
            max-length = 35;
          };

          # Bar center modules
          "hyprland/workspaces" = {
            "persistent-workspaces" = {
              "*" = 6;
            };

            format = "{icon}";
            format-icons = {
              default = "";
              active = "";
              empty = "";
              persistent = "";
              urgent = "";
              sort-by-number = true;
            };
            on-scroll-up = "hyprctl dispatch workspace e-1";
            on-scroll-down = "hyprctl dispatch workspace e+1";
            on-click = "activate";
          };

          # Bar right side modules
          battery = {
            format = "{icon} {capacity}%";
            format-alt = "{icon} {time}";
            format-charging = " {capacity}%";
            format-icons = [ " " " " " " " " ];
          };

          backlight = {
            format = "󰃠 {percent}";
            interval = 2;
          };

          pulseaudio = {
            format = "{icon}  {volume} {format_source}";
            format-source = "";
            format-source-muted = "";
            format-bluetooth = " ᛒ {volume}";
            format-bluetooth-muted = " ";
            format-muted = "󰝟 {format_source}";
            format-icons.default = [ "" "" "" ];
            scroll-step = 5;
          };

          network = {
            format-wifi = "  {essid}";
            format-ethernet = "";
            tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
            format-linked = "{ifname} (No IP)";
            format-disconnected = "";
          };

          clock = {
            calendar.format = { today = "<b>{}</b>"; };
            format = " {:%H:%M}";
            tooltip = "true";
            tooltip-format = "{:%Y %B}";
            format-alt = " {:%d/%m}";
          };

          tray = {
            icon-size = 20;
            spacing = 8;
          };
        };
      };

      style = ''
        * {
            font-family: monospace;
            margin: 0;
            padding: 0;
        }

        window#waybar {
            background: rgba(0, 0, 0, 0);
        }

        .modules-left, .modules-center, .modules-right {
            background: #${config.lib.stylix.colors.base01};
            border-radius: 8px;
            border: 2px solid #${config.lib.stylix.colors.base03};
        }

        .modules-left {
            padding: 0 5px 0 12px;
        }

        .modules-center {
            padding: 0 10px;
        }

        .modules-right {
            padding: 0 15px;
        }

        #custom-icon {
            font-size: 20px;
            color: #${config.lib.stylix.colors.base07};
            padding-right: 10px;
        }

        #cpu,
        #memory,
        #temperature {
            font-size: 14px;
            background: #${config.lib.stylix.colors.base02};
            margin: 5px 0;
        }

        #cpu {
            color: #${config.lib.stylix.colors.base0E};
            padding: 0 12px;
            border-radius: 4px 0px 0px 4px;
        }

        #memory {
            color: #${config.lib.stylix.colors.base09};
            padding: 0 2px;
        }

        #temperature {
            color: #${config.lib.stylix.colors.base08};
            padding: 0 12px;
            border-radius: 0px 4px 4px 0px;
        }

        #window {
            padding: 0 7px 0 15px;
        }

        window#waybar.empty #window {
            padding: 0;
        }

        #workspaces button label {
            padding-right: 8px;
            margin: 0 4px;
        }

        #battery {
            color: #${config.lib.stylix.colors.base0C};
            padding-right: 12px;
        }

        #backlight,
        #pulseaudio {
            font-size: 14px;
            background: #${config.lib.stylix.colors.base02};
            margin: 5px 0;
        }

        #backlight {
            color: #${config.lib.stylix.colors.base0B};
            padding: 0 6px 0 10px;
            border-radius: 4px 0px 0px 4px;
        }

        #pulseaudio {
            color: #${config.lib.stylix.colors.base0D};
            padding: 0 10px 0 6px;
            border-radius: 0px 4px 4px 0px;
        }

        #custom-right-arrow {
            padding: 0 12px;
        }

        #network {
            color: #${config.lib.stylix.colors.base09};
        }

        #clock {
            color: #${config.lib.stylix.colors.base0E};
        }
      '';
    };
  };
}
