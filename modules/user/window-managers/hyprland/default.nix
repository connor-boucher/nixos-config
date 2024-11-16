{ config, lib, pkgs, ... }:

{
  options.hyprland.enable = lib.mkEnableOption "enables hyprland";

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
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
