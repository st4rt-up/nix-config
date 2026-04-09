{
  modules.ssh-agent = {
    nixos = {
      security.sudo.extraConfig = ''
        Defaults    env_keep+=SSH_AUTH_SOCK
      '';

      programs.ssh.startAgent = true;
    };

    home = {
      programs.ssh = {
        enable = true;
        enableDefaultConfig = false;
        matchBlocks."*" = {};
      };
    };
  };
}
