{ config, inputs, lib, my, ... }:

{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  options.communication.nixcord.enable = lib.mkEnableOption "enables nixcord";

  config = lib.mkIf config.communication.nixcord.enable {
    programs.nixcord = {
      enable = true;
      config = {
        useQuickCss = true;
        themeLinks = [ my.theme.nixcord.theme ];
        frameless = true;
      };
    };
  };
}
