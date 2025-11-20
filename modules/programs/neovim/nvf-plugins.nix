{username, ...}: {
  home-manager.users.${username} = {
    programs.nvf.settings.vim = {
      autocomplete.blink-cmp = {
        enable = true;

        setupOpts = {
          signature.enabled = true;
          completion.list.selection.auto_insert = false;
          completion.list.selection.preselect = false;
        };
      };

      # dashboard.alpha = { # overrides some important binds
      # enable = true; # greeter
      # };

      formatter = {
        conform-nvim.enable = true;
      };

      visuals = {
        nvim-cursorline.enable = true; # underline word under cursor
        cinnamon-nvim.enable = true; # smooth scrolling
        fidget-nvim.enable = true; # notifications (bottom right)

        # should be self explanatory
        nvim-web-devicons.enable = true;
        indent-blankline.enable = true;
        highlight-undo.enable = true;
      };

      notify.nvim-notify.enable = true; # pop up notifications (top right)

      navigation = {
        harpoon.enable = true; # turbo marks
      };

      # utility = {
      # motion.flash-nvim.enable = true; # turbo find / jump
      # surround.enable = true; # surround vim motions with brackets etc
      # };

      ui = {
        illuminate.enable = true; # highlight every occurance of word under cursor
        borders.enable = true;
        fastaction.enable = true; # codeactions

        nvim-highlight-colors.enable = true;

        colorizer = {
          # highlight colour codes
          enable = false;
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
        ui.enable = true;
        ui.autoStart = true;
      };
    };
  };
}
