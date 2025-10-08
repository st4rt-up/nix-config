_: {
  programs.nvf.settings.vim = {
    autocomplete.nvim-cmp = {
      enable = true;
      setupOpts = {
        completion.completeopt = "menu,menuone,noselect,fuzzy";
      };
    };

    # dashboard.alpha = {
    # enable = true; # greeter
    # };

    visuals = {
      # nvim-scrollbar.enable = true;
      nvim-cursorline.enable = true; # underline word under cursor
      cinnamon-nvim.enable = true; # smooth scrolling
      nvim-web-devicons.enable = true;

      highlight-undo.enable = true;
      fidget-nvim.enable = true; # notifications (bottom right)
      indent-blankline.enable = true;

      # rainbow-delimiters.enable = true;
    };

    notify.nvim-notify.enable = true; # pop up notifications (top right)

    navigation = {
      harpoon.enable = true; # turbo marks
    };

    utility = {
      motion.flash-nvim.enable = true; # turbo find / jump
      surround.enable = true;
    };

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

    #    filetree = {
    #      nvimTree.enable = true;
    #    };

    # mini = { tabline.enable = true;};

    binds = {
      # cheatsheet.enable = true;
      whichKey.enable = true;
    };

    debugger.nvim-dap = {
      enable = true;
      ui = {
        enable = true;
        autoStart = true;
      };
    };

    # git = {
    # enable = true;
    #      gitsigns = {
    #        enable = true;
    #        codeActions.enable = true;
    #      };
    # };
  };
}
