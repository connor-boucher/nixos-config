{ config, lib, ... }:

{
  imports = [
    ./emacs
    ./nixvim
  ];

  options.editors.enable = lib.mkEnableOption "enable editors";

  config = lib.mkIf config.editors.enable {
    emacs.enable = lib.mkDefault true;
    nixvim.enable = lib.mkDefault true;
  };
}
