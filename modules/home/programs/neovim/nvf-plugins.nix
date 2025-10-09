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
      nvim-cursorline.enable = true; # underline word under cursor
      cinnamon-nvim.enable = true; # smooth scrolling
      fidget-nvim.enable = true; # notifications (bottom right)

      nvim-web-devicons.enable = true;
      indent-blankline.enable = true;
      highlight-undo.enable = true;
    };

    notify.nvim-notify.enable = true; # pop up notifications (top right)

    navigation = {
      harpoon.enable = true; # turbo marks
    };

    utility = {
      motion.flash-nvim.enable = true; # turbo find / jump
      surround.enable = true; # surround vim motions with brackets etc
    };

    ui = {
      illuminate.enable = true; # highlight every occurance of word under cursor
      borders.enable = true;
      fastaction.enable = true;

      colorizer = {
        # highlight colour codes
        enable = true;
        setupOpts.filetypes."*" = {};
      };

      noice.enable = true; # visual overhaul
    };

    statusline.lualine = {
      enable = true;
      globalStatus = true;
      icons.enable = true;
    };

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
  };
}
