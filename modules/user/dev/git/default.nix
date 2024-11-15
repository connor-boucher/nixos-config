{ config, lib, ... }:

{
  options.git.enable = lib.mkEnableOption "enables git";

  config = {
    programs.git = lib.mkIf config.git.enable {
      enable = true;

      userName = "connor-boucher";
      userEmail = "60579609+connor-boucher@users.noreply.github.com";
    };
  };
}
