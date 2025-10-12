{username, ...}: {
  home-manager.users.${username} = {
    programs.nvf = {
      enable = true;

      settings.vim = {
        viAlias = true;
        vimAlias = true;

        syntaxHighlighting = true;
        lineNumberMode = "relNumber";
        lazy.enable = true;
        telescope.enable = true;

        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
        };

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

        diagnostics = {
          enable = true;
          config.virtual_text = true;
          # nvim-lint.enable = true;
        };

        lsp = {
          enable = true;
          formatOnSave = true;

          lightbulb.enable = true;
          lspSignature.enable = true;
          # trouble.enable = true;
        };
      };
    };
  };
}
