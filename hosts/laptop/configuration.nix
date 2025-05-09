{ config, inputs, ... }:

let
  myConfig = ./my.config.nix;
  home = ../../common/home.nix;
in
{
  imports = [
    (import ../../common/configuration.nix {
      inherit config home inputs myConfig;
    })
    ./hardware-configuration.nix
  ];
}
