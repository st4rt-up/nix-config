{config, ...}: {
  configurations.nixos.lobelia = _: {
    imports =
      (with config.modules; [
        lobelia-hardware
        systemd-boot
        quiet-boot

        networkmanager
        bluetooth
        fingerprint
        pipewire
        ssh-agent

        locale

        nh
        nix-settings
        nix-comma

        fonts
        plasma
      ])
      ++ (with config.configurations; [
        users.kai
      ]);
  };
}
