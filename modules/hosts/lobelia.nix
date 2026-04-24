{config, ...}: {
  configurations.nixos.lobelia = _: {
    imports =
      (with config.modules; [
        lobelia-hardware
        systemd-boot
        quiet-boot

        wayland
        # pipewire
        bluetooth
        fingerprint
        networkmanager

        ssh-agent
        locale
        direnv
        plymouth
        nh
        nix-settings
        nix-comma

        fonts
        plasma # safeguard
        nvf-temp
        nvf-nix
        nvf-vhdl
      ])
      ++ (with config.configurations; [
        users.kai
      ]);
  };

  modules.lobelia.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      firefox
      git
      neovim
    ];
  };
}
