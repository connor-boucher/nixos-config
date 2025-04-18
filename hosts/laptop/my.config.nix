{ inputs, lib, pkgs, ... }:

let
  my = {
    host = {
      name = "laptop";
      locale = {
        time = "Europe/London";
        locale = "en_GB.UTF-8";
      };
    };

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

    theme = {
      name = "rose-pine";
      polarity = "dark";
      wallpaper = ./wallpaper.jpg;
      base16Scheme = "rose-pine";
      spicetify = {
        theme = inputs.spicetify-nix.legacyPackages.${pkgs.system}.themes.text;
        colorScheme = "rosepine";
      };
    };
  };
in
{
  options.my = {
    host = lib.mkOption {
      type = with lib.types; attrs;
      description = "Shared global host settings.";
    };

    user = lib.mkOption {
      type = with lib.types; attrs;
      description = "Shared global user settings.";
    };

    theme = lib.mkOption {
      type = with lib.types; attrs;
      description = "Shared global theme settings.";
    };
  };

  config.my = my;
}
