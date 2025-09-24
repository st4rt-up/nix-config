{config, ...}: {
  wsl = {
    enable = true;

    defaultUser = config.var.username;

    wrapBinSh = true;

    wslConf = {
      automount.enabled = true;
    };
  };
}
