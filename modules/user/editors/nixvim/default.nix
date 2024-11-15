{ config, inputs, lib, pkgs, ... }:

{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  options.nixvim.enable = lib.mkEnableOption "enables nixvim";

  config = {
    programs.nixvim = lib.mkIf config.nixvim.enable {
      enable = true;

      # Enable aliases
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      # Custom options
      opts = {
        # Disable temporary files
        backup = false;
        swapfile = false;
        writebackup = false;

        # Line numbers
        number = true;
        relativenumber = true;

        # Tab settings
        smartindent = true;
        expandtab = true;
        tabstop = 4;
        softtabstop = 4;
        shiftwidth = 4;
      };

      # Install plugins
      plugins.nix.enable = true;
      plugins.transparent.enable = true;
    };
  };
}
