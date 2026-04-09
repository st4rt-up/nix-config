{config, ...}: {
  configurations.nixos.lobelia = _: {
    imports =
      (with config.modules; [
        lobelia-hardware
        systemd-boot
        quiet-boot
      ])
      ++ (with config.configurations; [
        users.kai
      ]);
  };
}
