{username, ...}: {
  home-manager.users.${username} = {
    programs.nvf = {
      enable = true;

      settings.vim = {
        viAlias = true;
        vimAlias = true;

        syntaxHighlighting = true;
        lineNumberMode = "relNumber";
        hideSearchHighlight = true;
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

        diagnostics = {
          enable = true;
          config.virtual_text = true;
          # nvim-lint.enable = true;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          lspconfig.enable = true;

          lightbulb.enable = true;
          # lspSignature.enable = true;
          trouble.enable = true;
        };
      };
    };
  };
}
