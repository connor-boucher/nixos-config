{ config, lib, ... }:

{
  options.shells.nushell.enable = lib.mkEnableOption "enables nushell";

  config = lib.mkIf config.shells.nushell.enable {
    programs.nushell = {
      enable = true;

      extraConfig = ''
        # Disable startup banner
        $env.config = {
          show_banner: false
        }

        # Disable timestamp on prompt
        $env.PROMPT_COMMAND_RIGHT = ""
      '';
    };
  };
}
