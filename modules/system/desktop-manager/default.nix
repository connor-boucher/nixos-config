{ pkgs, ... }:

{
  config = {
    programs.dconf.enable = true;

    services.xserver.desktopManager.mate = {
      enable = true;
      extraPanelApplets = [ pkgs.mate.mate-applets ];
      enableWaylandSession = true;
    };
  };
}
