{username, ...}: {
  security.sudo.extraConfig = ''
    Defaults    env_keep+=SSH_AUTH_SOCK
  '';

  programs.ssh = {
    startAgent = true;
  };

  home-manager.users.${username} = {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;

      matchBlocks = {
        "*" = {};
      };
    };
  };
}
