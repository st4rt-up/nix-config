{username, ...}: {
  home-manager.users.${username} = {
    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;

      options = ["--cmd cd"];
    };

    programs.bash.enable = true;
  };
}
