{username, ...}: {
  home-manager.users.${username} = {
    home.shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
    };
  };
}
