{ config, lib, ... }:

{
  imports = [
    ./emacs
    ./nvf
    ./zed
  ];

  options.editors.enable = lib.mkEnableOption "enable editors";

  config = lib.mkIf config.editors.enable {
    home.sessionVariables.EDITOR = lib.mkDefault "nvim";

    editors = {
      emacs.enable = lib.mkDefault true;
      nvf.enable = lib.mkDefault true;
      zed.enable = lib.mkDefault true;
    };
  };
}
