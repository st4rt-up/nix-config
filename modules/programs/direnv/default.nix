{username, ...}: {
  home-manager.users.${username} = {
    programs.direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;

      silent = true;
    };
  };
}
