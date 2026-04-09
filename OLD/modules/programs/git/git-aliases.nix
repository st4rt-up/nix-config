{username, ...}: {
  home-manager.users.${username} = {
    home.shellAliases = {
      "ga" = "git add --patch";
      "gc" = "git commit";
      "gcm" = "git commit -m";
      "gs" = "git status;git log --oneline -4";
    };
  };
}
