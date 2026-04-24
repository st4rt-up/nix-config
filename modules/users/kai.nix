{config, ...}: {
  configurations.users.kai = _: {
    imports = with config.modules; [
      kai
      networkmanager
      admin
      pipewire

      firefox
      git
      tmux
      steam
    ];
  };

  modules.kai.user = {
    initialPassword = "password";
  };
}
