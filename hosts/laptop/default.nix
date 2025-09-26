{hostname, ...}: let
  username = "kai";
in let
  files-directory = "/home/${username}/files";
  config-directory = "/home/${username}/files/dev-nix/nix-config";
  syncthing-key-path = "/run/${username}/syncthing-laptop";
in {
  # set variables declared in /modules/core/config-host
  config = {
    var = {
      inherit username hostname config-directory files-directory;

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
  };

  imports = [
    # {_module.args = {inherit inputs;};}

    ./../../modules/themes/kai-dark.nix

    # system level imports
    ./../../modules/system/fonts.nix

    ./../../modules/system/systemd-boot.nix
    ./../../modules/system/pipewire.nix
    ./../../modules/system/bluetooth.nix
    # ./../../modules/system/fingerprint.nix
    ./../../modules/system/power-management.nix

    # ./../../modules/system/steam.nix

    ./syncthing.nix

    ./../../modules/home
    ./hardware-configuration.nix

    ./../../modules/system/greetd.nix
    ./../../modules/system/wayland.nix
    # ./../../modules/system/gnome.nix

    ./../../modules/system/thunar.nix

    ./../../modules/optional/school-packages.nix
  ];

  config.system.stateVersion = "24.11";
}
