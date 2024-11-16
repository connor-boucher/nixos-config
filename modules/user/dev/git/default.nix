{ config, lib, ... }:

{
  options.git.enable = lib.mkEnableOption "enables git";

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;

      userName = "connor-boucher";
      userEmail = "60579609+connor-boucher@users.noreply.github.com";
    };
  };
}
