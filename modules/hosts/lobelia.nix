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
        quiet-boot
        plymouth

        # == core system
        wayland
        pipewire
        bluetooth
        fingerprint
        networkmanager
        drawing-tablet
        ssh-agent
        locale

        fonts
        papirus-icons

        # == desktop environment / interface
        greetd
        niri
        quickshell
        # noctalia
        yazi
        stasis

        # kitty
        # plasma

        # == nix
        nh
        nix-settings
        nix-comma
        direnv

        # == dev tools
        cargo

        nvf-temp
        nvf-rust
        nvf-qt
        nvf-nix
        nvf-vhdl
        nvf-python
        nvf-java

        intellij

        # == school
        distrobox
        misc-usr-fix
        vivado-usb
      ])
      ++ (with config.configurations; [
        users.kai
      ]);
  };

  modules.lobelia.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      libreoffice
      # labwc
      krita
      aseprite
      kdePackages.okular
      godot
      obs-studio
      vlc
      mpv
      qalculate-qt
    ];

    services.greetd.settings = let
      cmd = "${pkgs.niri}/bin/niri-session";
    in {
      initial_session.command = cmd;
      default_session.command = cmd;
    };
  };
}
