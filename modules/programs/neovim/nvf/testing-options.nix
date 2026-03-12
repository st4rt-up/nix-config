{username, ...}: {
  home-manager.users.${username} = {
    programs.nvf = {
      vim.settings = {
        utility.smart-split = {
          enable = true;
          keymaps = {
            move_cursor_left = "<C-h>";
            move_cursor_up = "<C-j>";
            move_cursor_down = "<C-k>";
            move_cursor_right = "<C-l>";
          };
        };
        utility.yazi-nvim = {
          enable = true;

          setupOpts.open_for_directories = true;
        };
      };
    };
  };
}
