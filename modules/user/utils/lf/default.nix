{ config, lib, ... }:

{
  options.lf.enable = lib.mkEnableOption "enables lf";

  config = lib.mkIf config.lf.enable {
    programs.lf = {
      enable = true;

      settings = {
        drawbox = true;
        hidden = true;
        ignorecase = true;
        preview = true;
      };
    };
  };
}
