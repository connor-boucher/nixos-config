{ config, lib, ... }:

{
  options.nushell.enable = lib.mkEnableOption "enables nushell";

  config = {
    programs.nushell = lib.mkIf config.nushell.enable {
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
