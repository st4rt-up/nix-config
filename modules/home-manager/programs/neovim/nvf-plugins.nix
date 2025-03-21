{...}: {
  programs.nvf.settings.vim = {
    minimap.codewindow.enable = true;
    
    visuals = {
      nvim-scrollbar.enable = true;
      nvim-cursorline.enable = true;
      nvim-web-devicons.enable = true;

      highlight-undo.enable = true;
      fidget-nvim.enable = true;
      indent-blankline.enable = true;
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

    git = {
      enable = true;
      # gitsigns.enable = true;
      # gitsigns.codeActions.enable = false;
    };
  };
}
