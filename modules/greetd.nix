{
  modules.greetd.nixos = {
    services.greetd = {
      enable = true;
      settings.terminal.vt = 1;
    };
  };
}
