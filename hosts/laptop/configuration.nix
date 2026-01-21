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
}
