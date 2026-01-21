{ config, inputs, pkgs, ... }:

let
  myConfig = ./my.config.nix;
  home = ../../common/home.nix;
in
{
  imports = [
    (import ../../common/configuration.nix {
      inherit config home inputs myConfig pkgs;
    })
    ./hardware-configuration.nix

    ../../modules/system/graphics/nvidia
  ];

  # Set correct GRUB resolution
  boot.loader.grub = {
    gfxmodeEfi = "2560x1440";
    gfxpayloadEfi = "2560x1440";
  };

  # Install steam for gaming
  programs = {
    gamemode.enable = true;

    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  # MangoHud for performance monitoring
  environment.systemPackages = with pkgs; [
    mangohud
  ];
}
