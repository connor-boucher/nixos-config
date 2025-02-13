{ config, inputs, lib, pkgs, ... }:

{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  options.nixvim.enable = lib.mkEnableOption "enables nixvim";

  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      enable = true;

      # Enable aliases
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

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
      plugins = {
        bufferline.enable = true;
        bufferline.settings = {
          options = {
            separator_style = "thin";
          };
        };
        cmp-emoji.enable = true;
        cmp = {
          enable = true;
          settings = {
            autoEnableSources = true;
            experimental = {
              ghost_text = true;
            };
            sources = [
              { name = "nvim_lsp"; }
              { name = "emoji"; }
              { name = "paths"; keywordLength = 3; }
            ];
            formatting = {
              fields = [
                "kind"
                "abbr"
                "menu"
              ];
            };
            window = {
              completion = {
                border = "solid";
              };
              documentation = {
                border = "solid";
              };
            };
          };
        };
        cmp-nvim-lsp.enable = true;
        cmp-path.enable = true;
        lualine.enable = true;
        lsp = {
          enable = true;
          inlayHints = true;
          servers = {
            nixd = {
              enable = true;
              autostart = true;
            };
          };
        };

        lsp-format.enable = true;
        nix.enable = true;
        telescope.enable = true;
        transparent.enable = true;

        treesitter = {
          enable = false;
          settings = {
            auto_install = false;
            highlight.enable = true;
            indent.enable = true;
          };
          nixvimInjections = true;
          grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
        };
        web-devicons.enable = true;
      };
    };
  };
}
