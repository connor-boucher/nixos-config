{ config, inputs, lib, ... }:

{
  imports = [ inputs.nvf.homeManagerModules.nvf ];

  options.editors.nvf.enable = lib.mkEnableOption "enables nvf";

  config = lib.mkIf config.editors.nvf.enable {
    programs.nvf = {
      enable = true;

      # Enable aliases
      settings = {
        vim = {
          viAlias = true;
          vimAlias = true;

          theme = {
            enable = true;
            name = "gruvbox";
            style = "dark";
            transparent = true;
          };

          visuals = {
            nvim-web-devicons.enable = true;
            nvim-cursorline.enable = true;

            highlight-undo.enable = true;
          };

          statusline.lualine = {
            enable = true;
            theme = "gruvbox_dark";
          };
          tabline.nvimBufferline.enable = true;

          telescope.enable = true;
          autocomplete.nvim-cmp.enable = true;

          languages = {
            enableLSP = true;
            enableTreesitter = true;

            nix.enable = true;
            clang.enable = true;
          };

          ui = {
            borders.enable = true;
            noice.enable = true;
            colorizer.enable = true;
            illuminate.enable = true;
          };

          options = {
            # Disable temporary files
            backup = false;
            swapfile = false;
            writebackup = false;

            # Line numbers
            number = true;
            relativenumber = true;

            # Tab settings
            expandtab = true;
            tabstop = 4;
            softtabstop = 4;
            shiftwidth = 4;
          };
        };
      };
    };
  };
}
