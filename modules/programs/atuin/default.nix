{username, ...}: {
  home-manager.users.${username} = {
    programs.atuin = {
      enable = true;
      enableBashIntegration = true;

      flags = [
        "--disable-up-arrow"
      ];
    };

    programs.bash.enable = true;
  };
}
