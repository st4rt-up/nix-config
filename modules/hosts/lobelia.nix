{
  config,
  # inputs,
  ...
}: {
  configurations.nixos.lobelia = _: {
    imports =
      (with config.modules; [
        # == system specific
        lobelia
        lobelia-hardware
        syncthing-lobelia

        # == boot
        systemd-boot
        # quiet-boot
        plymouth

        # == core system
        wayland
        pipewire
        bluetooth
        fingerprint
        networkmanager
        ssh-agent
        locale

        fonts
        papirus-icons

        # == desktop environment / interface
        niri
        quickshell
        yazi
        stasis
        greetd
        noctalia
        # kitty
        libreoffice
        misc-files
        labwc
        # plasma

        # == art
        # aseprite
        # krita

        # == nix
        nh
        nix-settings
        nix-comma
        direnv

        # == dev tools
        cargo
        intellij
        # godot

        nvf-temp
        nvf-rust
        nvf-qt
        nvf-nix
        nvf-vhdl
        nvf-python
        # nvf-java

        # == school
        distrobox
        misc-usr-fix
        vivado-usb
      ])
      ++ (with config.configurations.users; [
        kai
      ]);
  };

  modules.lobelia.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      obs-studio
      qalculate-qt
      feh
    ];
  };
}
