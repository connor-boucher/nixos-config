{ config, lib, my, ... }:

{
  options.zed.enable = lib.mkEnableOption "enables zed";

  config = lib.mkIf config.zed.enable {
    programs.zed-editor = {
      enable = true;
      extensions = [ my.theme.zed.theme.pkg ];
      userSettings = lib.mkForce {
        # Disable telemetry
        telemetry = {
          diagnostics = false;
          metrics = false;
        };

        # Input mode
        vim_mode = true;

        # Editor fonts
        ui_font_family = "JetBrains Mono";
        terminal.font_family = "JetBrains Mono";

        # UI theme
        theme = {
          mode = my.theme.polarity;
          light = my.theme.zed.theme.light;
          dark = my.theme.zed.theme.dark;
        };
      };
    };
  };
}
