{username, ...}: {
  home-manager.users.${username} = {
    programs.jujutsu = {
      enable = true;
    };
  };
}
