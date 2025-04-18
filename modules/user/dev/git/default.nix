{ config, lib, my, ... }:

{
  options.git.enable = lib.mkEnableOption "enables git";

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;

      userName = my.user.git.username;
      userEmail = my.user.git.email;
    };
  };
}
