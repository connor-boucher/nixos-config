{ config, lib, my, ... }:

{
  options.dev.git.enable = lib.mkEnableOption "enables git";

  config = lib.mkIf config.dev.git.enable {
    programs.git = {
      enable = true;

      settings.user = {
        name = my.user.git.username;
        email = my.user.git.email;
      };
    };
  };
}
