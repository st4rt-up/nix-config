# currently requires home-manager
{username, ...}: {
  home-manager.users.${username} = {
    programs.kitty = {
      enable = true;
      settings = {
        # ==== CURSOR SETTINGS
        cursor_trail = 1;
        cursor_trail_decay = "0.05 0.1";
        # cursor = "#ffffff";
        # cursor_shape = "beam";
      };
    };
  };
}
