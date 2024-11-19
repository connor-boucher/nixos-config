{ config, lib, ... }:

{
  imports = [
    ./librewolf
    ./qutebrowser
  ];

  options.browsers.enable = lib.mkEnableOption "enable browsers";

  config = lib.mkIf config.browsers.enable {
    home.sessionVariables.BROWSER = lib.mkDefault "librewolf";

    librewolf.enable = lib.mkDefault true;
    qutebrowser.enable = lib.mkDefault false;
  };
}
