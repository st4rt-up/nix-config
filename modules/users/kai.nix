{config, ...}: {
  configurations.users.kai = _: {
    imports = with config.modules; [
      networkmanager
      admin
    ];
  };
}
