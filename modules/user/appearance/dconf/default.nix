{ config, lib, my, ... }:

{
  options.appearance.dconf.enable = lib.mkEnableOption "enables dconf";

  config = lib.mkIf config.appearance.dconf.enable {
    dconf.settings = {
      "org/mate/desktop/background" = {
        picture-filename = "" + my.theme.wallpaper;
      };
      "org/mate/desktop/interface" = {
        gtk-theme = "adw-gtk3";
        icon-theme = my.theme.icons.name;
      };
      "org/mate/power-manager" = {
        backlight-battery-reduce = false;
        kbd-backlight-battery-reduce = false;
        idle-dim-battery = false;
      };
    };
  };
}
