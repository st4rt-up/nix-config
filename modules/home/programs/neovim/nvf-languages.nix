{pkgs, ...}: {
  programs.nvf = {
    settings.vim = {
      lsp.servers = {
        nixd = {
          filetypes = [
            "nix"
          ];
        };
        clangd = {
          filetypes = [
            "h"
            "hpp"
            "c"
            "cpp"
          ];
          root_markers = [".git"];
        };
        vhdl-ls = {
          cmd = ["vhdl_ls"];
          filetypes = ["vhdl" "vhd"];
        };
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
        enableDAP = true;

        nix = {
          enable = true;
          treesitter.enable = false;

          lsp = {
            enable = true;
            server = "nixd";

            options = {
              nixpkgs = {expr = "import <nixpkgs> { }";};
              formatting.command = ["alejandra"];
            };
          };
        };

        rust = {
          enable = true;
          # crates.enable = true;
        };

        clang = {
          enable = true;
          cHeader = true;

          lsp = {
            enable = true;
          };

          dap = {
            enable = true;
          };
        };

        python = {
          enable = true;
        };

        markdown = {
          enable = true;

          format.enable = true;

          extensions = {
            render-markdown-nvim.enable = true;
          };
        };
      };
    };
  };
}
