{hostname, ...}: let
  username = "kai";
  users = [
    "kai-new"
  ];
  systemImports = [
    "fonts"
    "systemd-boot"
    "pipewire-audio"
    "bluetooth"
    "power-management"
    "greetd"
  ];
in let
  files-directory = "/home/${username}/files";
  config-directory = "/home/${username}/files/dev-nix/nix-config";
  syncthing-key-path = "/run/${username}/syncthing-laptop";
in {
  # set variables declared in /modules/core/config-host
  config = {
    var = {
      inherit hostname config-directory files-directory;

      terminal = "kitty";
      gui = true;

      secrets = true;

      timezone = "America/Toronto";

      wallpaper = "${config-directory}/wallpaper/cherry-blossom.jpg";
    };

    services.syncthing = {
      key = "${syncthing-key-path}/key.pem";
      cert = "${syncthing-key-path}/cert.pem";
    };

    sops.secrets = {
      "secrets/syncthing/laptop/key".path = "${syncthing-key-path}/key.pem";
      "secrets/syncthing/laptop/cert".path = "${syncthing-key-path}/cert.pem";
    };
    system.stateVersion = "24.11";
  };

  imports =
    [
      # {_module.args = {inherit inputs;};}
      ./../../modules/themes/kai-dark.nix

      ./hardware-configuration.nix
      ./syncthing.nix
    ]
    ++ map (p: ./../../modules/system/${p}.nix) systemImports
    ++ map (user: ./../../modules/users/${user}.nix) users;
}
