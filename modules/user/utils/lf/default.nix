{ config, lib, ... }:

{
  options.utils.lf.enable = lib.mkEnableOption "enables lf";

  config = lib.mkIf config.utils.lf.enable {
    # Custom file icons
    xdg.configFile."lf/icons".source = ./icons;

    programs.lf = {
      enable = true;

      settings = {
        info = "size";
        drawbox = true;
        hidden = true;
        icons = true;
        ignorecase = true;
        preview = true;
      };
    };
  };
}
