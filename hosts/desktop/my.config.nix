{ inputs, lib, pkgs, ... }:

let
  my = {
    user = {
      name = "Connor";
      username = "connor";
      home = "/home/connor";
      shell = pkgs.zsh;

      git = {
        username = "connor-boucher";
        email = "60579609+connor-boucher@users.noreply.github.com";
      };
    };

    host = {
      name = "desktop";
      locale = {
        time = "Europe/London";
        locale = "en_GB.UTF-8";
      };
    };

    theme = import ../../modules/system/themes/rose-pine { inherit inputs pkgs; };
  };
in
{
  options.my = {
    user = lib.mkOption {
      type = with lib.types; attrs;
      description = "Shared global user settings.";
    };

    host = lib.mkOption {
      type = with lib.types; attrs;
      description = "Shared global host settings.";
    };

    theme = lib.mkOption {
      type = with lib.types; attrs;
      description = "Shared global theme settings.";
    };
  };

  config.my = my;
}
