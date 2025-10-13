{username, ...}: {
  home-manager.users.${username}.
    programs.nvf.settings.vim = {
    binds.hardtime-nvim = {
      enable = true;

      setupOpts = {
        max_count = 5;
        restriction_mode = "hint_and_block";
        disable_mouse = true;
      };
    };

    keymaps = [
      {
        key = "B";
        mode = "n";
        silent = true;
        action = "^";
      }
      {
        key = "E";
        mode = "n";
        silent = true;
        action = "$";
      }
    ];
  };
}
