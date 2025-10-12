{hostname, ...}: let
  username = "kai";
in let
  files-directory = "/home/${username}/files";
  config-directory = "/home/${username}/files/dev-nix/nix-config";
  #  syncthing-key-path = "/run/${username}/syncthing-laptop";
in {
  # set variables declared in /modules/core/config-host
  config = {
    var = {
      inherit
        hostname
        config-directory
        files-directory
        ;

      gui = false;
      secrets = true;

      timezone = "America/Toronto";
    };
  };

  imports = [
    ./../../modules/themes/kai-dark.nix
    ./hardware-configuration.nix
    # ./syncthing.nix

    ./../../modules/home

    ./../../modules/optional/school-packages.nix
  ];

  config.system.stateVersion = "24.11";
}
