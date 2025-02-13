{ config, lib, ... }:

{
  imports = [
    ./emacs
    ./nvf
  ];

  options.editors.enable = lib.mkEnableOption "enable editors";

  config = lib.mkIf config.editors.enable {
    home.sessionVariables.EDITOR = lib.mkDefault "nvim";

    emacs.enable = lib.mkDefault true;
    nvf.enable = lib.mkDefault true;
  };
}
