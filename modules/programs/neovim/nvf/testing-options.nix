{username, ...}: {
  home-manager.users.${username} = {
    programs.nvf = {};
  };
}
