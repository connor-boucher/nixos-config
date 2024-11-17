{ config, lib, ... }:

{
  imports = [
    ./qutebrowser
  ];

  options.browsers.enable = lib.mkEnableOption "enable browsers";

  config = lib.mkIf config.browsers.enable {
    home.sessionVariables.BROWSER = lib.mkDefault "brave";

    qutebrowser.enable = lib.mkDefault true;
  };
}
