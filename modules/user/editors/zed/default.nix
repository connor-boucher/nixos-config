{ config, lib, my, ... }:

{
  options.editors.zed.enable = lib.mkEnableOption "enables zed";

  config = lib.mkIf config.editors.zed.enable {
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

        assistant = {
          enabled = true;
          version = "2";
          default_open_ai_model = null;
          default_model = {
            provider = "zed.dev";
            model = "claude-3-5-sonnet-latest";
          };
        };
      };
    };
  };
}
