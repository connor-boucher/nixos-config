{ config, inputs, lib, my, ... }:

{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  options.communication.discord.enable = lib.mkEnableOption "enables discord";

  config = lib.mkIf config.communication.discord.enable {
    programs.nixcord = {
      enable = true;
      discord.vencord.enable = true;

      config = {
        useQuickCss = true;
        themeLinks = [ my.theme.nixcord.theme ];
        frameless = true;
      };
    };
  };
}
