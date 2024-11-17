{ config, lib, ... }:

{
  options.nh.enable = lib.mkEnableOption "enables nh";

  config = lib.mkIf config.nh.enable {
    programs.nh = {
      enable = true;

      # Clean old builds
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 5";
    };
  };
}
