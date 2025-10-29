{ pkgs, ... }:

{
  config = {
    services = {
      xserver.enable = true;
      displayManager.gdm.enable = true;
    };

    environment.sessionVariables = {
      "NIXOS_OZONE_WL" = "1";
      "ELECTRON_OZONE_PLATFORM_HINT" = "auto";
    };

    programs.xwayland.enable = true;
    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
  };
}
