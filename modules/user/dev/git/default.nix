{ config, lib, my, ... }:

{
  options.dev.git.enable = lib.mkEnableOption "enables git";

  config = lib.mkIf config.dev.git.enable {
    programs.git = {
      enable = true;

      userName = my.user.git.username;
      userEmail = my.user.git.email;
    };
  };
}
