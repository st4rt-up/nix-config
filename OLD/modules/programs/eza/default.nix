{username, ...}: {
  home-manager.users.${username} = {
    programs.eza = {
      enable = true;
      enableBashIntegration = true;

      git = true;
      icons = "auto";
    };

    home.shellAliases = {
      "ls" = "eza";
    };
  };
}
