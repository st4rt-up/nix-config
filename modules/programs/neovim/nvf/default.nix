{
  username,
  inputs,
  ...
}: let
  langs = [
    "assembly"
    "c-cpp"
    "java"
    "markup"
    "nix"
    "python"
    "rust"
    "vhdl"
  ];
in {
  # contents and names of entire folder is temporary
  imports =
    map (lang: ./languages/nvf-${lang}.nix) langs
    ++ [
      inputs.nvf.nixosModules.default
    ];

  home-manager.users.${username} = {
    imports = [inputs.nvf.homeManagerModules.default];
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

        options = {
          tabstop = 2;
          softtabstop = 2;
          shiftwidth = 2;
          expandtab = true;
          smartindent = true;

          mouse = "";
          wrap = false;
          # hlsearch = false;
        };

        diagnostics = {
          enable = true;
          config.virtual_text = true;
          # nvim-lint.enable = true;
        };

        treesitter = {
          enable = true;
          highlight.enable = true;

          textobjects.enable = true;
          fold = true; # I don't really use this ...?
        };

        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;
          enableDAP = true;
        };

        lsp = {
          enable = true;
          formatOnSave = true;

          lspconfig.enable = true;
          lightbulb.enable = true;
          trouble.enable = true;
        };

        debugger.nvim-dap = {
          enable = true;
          ui.enable = true;
          ui.autoStart = true;
        };

        # == plugins
        autocomplete.blink-cmp = {
          enable = true;

          setupOpts = {
            signature.enabled = true;
            completion.list.selection.auto_insert = false;
            completion.list.selection.preselect = false;
          };
        };

        formatter.conform-nvim.enable = true;
        navigation.harpoon.enable = true; # turbo marks
        notify.nvim-notify.enable = true; # pop up notifications (top right)

        binds.whichKey.enable = true; # keyboard binds popup

        statusline.lualine = {
          enable = true;
          globalStatus = true;
          icons.enable = true;
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

        ui = {
          illuminate.enable = true; # highlight every occurance of word under cursor
          borders.enable = true;
          fastaction.enable = true; # codeactions
          nvim-highlight-colors.enable = true;
          colorizer.enable = false; # highlight colour codes
          noice.enable = true; # visual overhaul
        };
      };
    };
  };
}
