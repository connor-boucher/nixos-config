{ config, lib, ... }:

{
  options.nushell.enable = lib.mkEnableOption "enables nushell";

  config = lib.mkIf config.nushell.enable {
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
