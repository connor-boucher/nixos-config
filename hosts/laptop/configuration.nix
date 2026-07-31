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
  ];

  # Enable LUKS decryption and key file on SD card
  #boot.initrd.luks.devices = {
  #  luksroot = {
  #    device = "/dev/disk/by-uuid/163ee892-f157-4234-94d8-8776049814fa";
  #    keyFile = "/dev/disk/by-uuid/E25E-CDE1";
  #    keyFileSize = 1024;
  #  };
  #};
}
