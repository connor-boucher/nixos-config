{ config, lib, pkgs, ... }:

{
  options.river.enable = lib.mkEnableOption "enables river";

  config = lib.mkIf config.river.enable {
    # Important for making wallpapers work as stylix depends on hyprpaper
    services.hyprpaper.enable = true;

    wayland.windowManager.river = {
      enable = true;
      settings = {
        border-width = 2;
        default-attach-mode = "bottom";
        default-layout = "rivertile";
        hide-cursor = {
          timeout = 10000;
          when-typing = true;
        };
        map = {
          normal = {
            "Super Return" = "spawn '${config.home.sessionVariables.TERMINAL}'";
            "Super b" = "spawn '${config.home.sessionVariables.BROWSER}'";
            "Super d" = "spawn 'discord'";
            "Super f" = "spawn '${config.home.sessionVariables.TERMINAL} -e ${pkgs.lf}/bin/lf'";
            "Super m" = "spawn '${config.home.sessionVariables.TERMINAL} -e ${pkgs.pulsemixer}/bin/pulsemixer'";
            "Super s" = "spawn 'spotify'";

            "Super J" = "focus-view next";
            "Super K" = "focus-view previous";
            "Super+Shift J" = "swap next";
            "Super+Shift K" = "swap previous";

            "Super H" = "send-layout-cmd rivertile 'main-ratio -0.05'";
            "Super L" = "send-layout-cmd rivertile 'main-ratio +0.05'";
            "Super+Shift H" = "send-layout-cmd rivertile 'main-count +1'";
            "Super+Shift L" = "send-layout-cmd rivertile 'main-count -1'";

            "Super+Shift C" = "close";
            "Super+Shift Q" = "exit";
          };
        };
        rule-add = {
          "ssd" = "";
        };
      };
      extraConfig = ''
        for i in $(seq 1 9)
        do
            tags=$((1 << ($i - 1)))
            riverctl map normal Super $i set-focused-tags $tags
            riverctl map normal Super+Shift $i set-view-tags $tags
        done

        rivertile -view-padding 6 -outer-padding 6 -main-ratio 0.5 &
      '';
    };
  };
}
