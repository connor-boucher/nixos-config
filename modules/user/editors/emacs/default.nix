{ config, inputs, lib, ... }:

{
  options.emacs.enable = lib.mkEnableOption "enables emacs";

  config = {
    # Include the community overlay
    nixpkgs.overlays = [ (import inputs.emacs-overlay) ];

    programs.emacs = lib.mkIf config.emacs.enable {
      enable = true;
    };
  };
}
