{hostname, ...}: let
  users = [
    "kai"
  ];
  systemImports = [
    "fonts"
    "systemd-boot"
    "pipewire-audio"
    "bluetooth"
    "power-management"
    "greetd"
  ];

  syncthing-key-path = "/run/syncthing-laptop";
in {
  # set variables declared in /modules/core/config-host
  config = {
    var = {
      inherit hostname;
      gui = true;
      secrets = true;
      timezone = "America/Toronto";
    };

    # ==== SYNCTHING
    services.syncthing.key = "${syncthing-key-path}/key.pem";
    services.syncthing.cert = "${syncthing-key-path}/cert.pem";
    sops.secrets."secrets/syncthing/laptop/key".path = "${syncthing-key-path}/key.pem";
    sops.secrets."secrets/syncthing/laptop/cert".path = "${syncthing-key-path}/cert.pem";

    system.stateVersion = "24.11";
  };

  imports =
    [
      ./../../modules/themes/kai-dark.nix

      ./hardware-configuration.nix
      ./syncthing.nix
    ]
    ++ map (p: ./../../modules/system/${p}.nix) systemImports
    ++ map (user: ./../../modules/users/${user}.nix) users;
}
