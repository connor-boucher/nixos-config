{ config, lib, ... }:

{
  imports = [
    ./emacs
    ./nixvim
  ];

  options.editors.enable = lib.mkEnableOption "enable editors";

  config = lib.mkIf config.editors.enable {
    home.sessionVariables.EDITOR = lib.mkDefault "nvim";

    emacs.enable = lib.mkDefault true;
    nixvim.enable = lib.mkDefault true;
  };
}
