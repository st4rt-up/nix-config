{inputs, ...}: {
  modules.nvf-temp.nixos = {
    imports = [
      inputs.nvf.nixosModules.default
    ];

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
          # smartindent = true;

          mouse = "";
          wrap = false;
          # hlsearch = false;
        };

        diagnostics = {
          enable = true;
          config.virtual_text = true;
          # nvim-lint.enable = true;
        };

        utility = {
          yazi-nvim.enable = true;
          yazi-nvim.setupOpts.open_for_directories = true;
          direnv.enable = true;
        };

        treesitter = {
          enable = true;
          highlight.enable = true;

          # textobjects.enable = true; # broken
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
        # navigation.harpoon.enable = true; # turbo marks
        notify.nvim-notify.enable = true; # pop up notifications (top right)

        binds.whichKey.enable = true; # keyboard binds popup

        statusline.lualine = {
          enable = true;
          globalStatus = true;
          icons.enable = true;
        };

        session = {
          nvim-session-manager = {
            enable = true;
            setupOpts.autoload_mode = "CurrentDir";
          };
        };

        visuals = {
          nvim-cursorline.enable = true; # underline word under cursor
          cinnamon-nvim.enable = true; # smooth scrolling
          fidget-nvim.enable = true; # notifications (bottom right)
          indent-blankline.enable = true; # shows levels of indentation

          # should be self explanatory
          nvim-web-devicons.enable = true;
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

        binds.hardtime-nvim = {
          enable = true;

          setupOpts = {
            max_count = 8;
            restriction_mode = "hint";
            disable_mouse = true;
          };
        };

        keymaps = let
          # factoring out stuff to make it pretty makes it unintuitive
          # find out a more elegant solution to this later
          # purely so I can see more binds at once
          normalMode = {mode = "n";};
          allModes = {mode = ["n" "x" "v"];};
          insertMode = {mode = "i";};

          # noWait = {nowait = true;};
          # unbind = key: (mkBind key "" {});
          mkBind = key: action: {
            mode ? ["n"],
            silent ? true,
            desc ? null,
            nowait ? false,
          }: {
            inherit key action mode silent desc nowait;
          };
        in [
          (mkBind "B" "^" allModes)
          (mkBind "E" "$" allModes)

          # (mkBind "oo" "o<Esc>" noWait)
          # (mkBind "OO" "O<Esc>" noWait)
          (mkBind "n" "nzzzv" {})
          (mkBind "N" "Nzzzv" {})
          (mkBind "<C-d>" "<C-d>zz" {})
          (mkBind "<C-u>" "<C-u>zz" {})

          (mkBind "<M-h>" "<C-w>h" normalMode)
          (mkBind "<M-j>" "<C-w>j" normalMode)
          (mkBind "<M-k>" "<C-w>k" normalMode)
          (mkBind "<M-l>" "<C-w>l" normalMode)

          (mkBind "<C-h>" "<Left>" insertMode)
          (mkBind "<C-l>" "<Right>" insertMode)
        ];
      };
    };
  };
}
