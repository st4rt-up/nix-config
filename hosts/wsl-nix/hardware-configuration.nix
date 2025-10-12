{username, ...}: {
  wsl = {
    enable = true;

    defaultUser = username;

    wrapBinSh = true;

    wslConf = {
      automount.enabled = true;
    };
  };
}
