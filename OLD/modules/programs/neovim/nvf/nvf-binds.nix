{username, ...}: {
  home-manager.users.${username}.
    programs.nvf.settings.vim = {
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
}
