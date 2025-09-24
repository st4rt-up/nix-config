{...}: {
  security.sudo.extraConfig = ''
    Defaults    env_keep+=SSH_AUTH_SOCK
  '';

  programs.ssh = {
    startAgent = true;
  };
}
