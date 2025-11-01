{username, ...}: {
  home-manager.users.${username} = {
    programs.atuin = {
      enable = true;
      enableBashIntegration = true;

      flags = [
        "--disable-up-arrow"
      ];

      settings = {
        sync_address = "https://api.atuin.sh";
        search_mode = "fuzzy";
      };
    };

    programs.bash.enable = true;
  };
}
