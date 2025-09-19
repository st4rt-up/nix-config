{
  config,
  lib,
  hostname,
  ...
}: let
  username = "kai";
in let
  files-directory = "/home/${username}/files";
  config-directory = "/home/${username}/files/dev-nix/nix-config";
in {
  # set variables declared in /modules/core/config-host
  config = {
    var = {
      inherit username hostname config-directory files-directory;

      terminal = "kitty";
      gui = true;

      timezone = "America/Toronto";

      wallpaper = "${config-directory}/wallpaper/cherry-blossom.jpg";
    };

    services.syncthing = {
      key = "/run/${username}/syncthing-laptop/key.pem";
      cert = "/run/${username}/syncthing-laptop/cert.pem";
    };

    sops.secrets = {
      "secrets/syncthing/laptop/key" = {
        path = "/run/${username}/syncthing-laptop/key.pem";
      };
      "secrets/syncthing/laptop/cert" = {
        path = "/run/${username}/syncthing-laptop/cert.pem";
      };
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

    ./../../modules/system/steam.nix
    ./../../modules/system/syncthing.nix

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
