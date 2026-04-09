# called from /modules/hosts/default.nix
{hostname, ...}: let
  users = [
    "kai"
  ];
  systemImports = [
    "fonts"
    "systemd-boot"
    "pipewire-audio"
    "bluetooth"
    "greetd"
  ];
  # syncthing-key-path = "/run/syncthing-laptop";
in {
  config = {
    # set variables declared in /modules/core/config-host
    var = {
      inherit hostname;
      gui = true;
      secrets = true;
      timezone = "America/Toronto";
      path.flake = "/home/kai/files/dev-nix/nix-config";
    };

    # ==== SYNCTHING
    # set device specific syncthing locations
    # services.syncthing.key = "${syncthing-key-path}/key.pem";
    # services.syncthing.cert = "${syncthing-key-path}/cert.pem";
    # sops.secrets."secrets/syncthing/laptop/key".path = "${syncthing-key-path}/key.pem";
    # sops.secrets."secrets/syncthing/laptop/cert".path = "${syncthing-key-path}/cert.pem";

    system.stateVersion = "24.11";
  };

  imports =
    [
      ./../../modules/theming
      ./../../modules/theming/themes/kai-dark

      ./hardware-configuration.nix
      # ./syncthing.nix
    ]
    ++ map (p: ./../../modules/system/${p}.nix) systemImports
    ++ map (user: ./../../modules/users/${user}.nix) users;
}
