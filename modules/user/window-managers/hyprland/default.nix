{ config, lib, pkgs, ... }:

{
  options.hyprland.enable = lib.mkEnableOption "enables hyprland";

  config = {
    wayland.windowManager.hyprland = lib.mkIf config.hyprland.enable {
      enable = true;

      settings = {
        # Set modifier key to Mod4
        "$mod" = "SUPER";

        # Custom keybindings
        bind = [
          "$mod, B, exec, brave"
          "$mod, RETURN, exec, foot"
          "$mod, C, killactive"
          "$mod Shift, Q, exit"
        ];

        # Monitor configurations
        monitor = [ "eDP-1, 1920x1080, 0x0, 1" ];
      };
    };
  };
}
