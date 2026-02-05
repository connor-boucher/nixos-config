{ config, lib, my, ... }:

{
  options.utils.git.enable = lib.mkEnableOption "enables git";

  config = lib.mkIf config.utils.git.enable {
    programs.git = {
      enable = true;

      settings.user = {
        name = my.user.git.username;
        email = my.user.git.email;
      };
    };
  };
}
