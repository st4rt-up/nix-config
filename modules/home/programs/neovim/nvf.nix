{...}: {
  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;

      clipboard.enable = true;
      syntaxHighlighting = true;

      lineNumberMode = "relative";

      options = {
        tabstop = 2;
        shiftwidth = 2;

        mouse = "";
      };

      keymaps = [
        {
          key = "<Up>";
          mode = ["n" "v" "i"];
          action = "<Nop>";
          silent = true;
          desc = "Unbind arrow keys (up)";
        }

        {
          key = "<Down>";
          mode = ["n" "v" "i"];
          action = "<Nop>";
          silent = true;
          desc = "Unbind arrow keys (down)";
        }

        {
          key = "<Right>";
          mode = ["n" "v" "i"];
          action = "<Nop>";
          silent = true;
          desc = "Unbind arrow keys (right)";
        }

        {
          key = "<Left>";
          mode = ["n" "v" "i"];
          action = "<Nop>";
          silent = true;
          desc = "Unbind arrow keys (left)";
        }
      ];

      lazy.enable = true;
      telescope.enable = true;
      treesitter.context.enable = true;

      lsp = {
        enable = true;
        formatOnSave = true;

        lightbulb.enable = true;
        trouble.enable = true;

        lspSignature.enable = true;
        # lsplines.enable = true;
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix = {
          enable = true;
          lsp.server = "nixd";
          treesitter.enable = false;
          lsp.options = {
            nixpkgs = {expr = "import <nixpkgs> { }";};
            formatting.command = ["alejandra"];
          };
        };

        rust = {
          enable = true;
          crates.enable = true;
        };

        clang = {
          enable = true;
          dap.enable = true;
        };
      };
    };
  };
}
