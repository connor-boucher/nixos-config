{ config, lib, ... }:

{
  imports = [
    ./firefox
    ./qutebrowser
  ];

  options.browsers.enable = lib.mkEnableOption "enable browsers";

  config = lib.mkIf config.browsers.enable {
    home.sessionVariables.BROWSER = lib.mkDefault "firefox";

    browsers = {
      firefox.enable = lib.mkDefault true;
      qutebrowser.enable = lib.mkDefault false;
    };
  };
}
