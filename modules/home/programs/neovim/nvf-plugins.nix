{...}: {
  programs.nvf.settings.vim = {
    minimap.codewindow.enable = true;
    spellcheck.enable = true;
    autocomplete.nvim-cmp.enable = true;

    dashboard.alpha = {
      enable = true; # greeter
    };

    visuals = {
      nvim-scrollbar.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
      nvim-web-devicons.enable = true;

      highlight-undo.enable = true;
      fidget-nvim.enable = true;
      indent-blankline.enable = true;
    };

    notify.nvim-notify.enable = true;

    ui = {
      colorizer.enable = true;

      borders.enable = true;
      fastaction.enable = true;
      illuminate.enable = true;

      noice.enable = true;
    };

    statusline.lualine = {
      enable = true;
      globalStatus = true;
      icons.enable = true;
    };

    binds = {
      cheatsheet.enable = true;
      whichKey.enable = true;
    };

    filetree.neo-tree.enable = true;

    debugger.nvim-dap = {
      enable = true;
      ui = {
        enable = true;

        autoStart = true;
      };
    };

    git = {
      enable = true;
      gitsigns.enable = true;
      # gitsigns.codeActions.enable = false;
    };
  };
}
