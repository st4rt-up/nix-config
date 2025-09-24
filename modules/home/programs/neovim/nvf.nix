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

      binds.hardtime-nvim = {
        enable = true;

        setupOpts = {
          max_count = 5;
          restriction_mode = "hint_and_block";
          disable_mouse = true;
        };
      };

      lazy.enable = true;
      telescope.enable = true;

      diagnostics = {
        enable = true;

        # nvim-lint.enable = true;

        config = {
          virtual_text = true;
          virtual_lines = true;
        };
      };

      lsp = {
        enable = true;
        formatOnSave = true;

        lightbulb.enable = true;
        trouble.enable = true;

        lspSignature.enable = true;

        inlayHints.enable = true;

        servers = {
          "clangd" = {
            filetypes = ["c"];
          };
        };
      };
    };
  };
}
