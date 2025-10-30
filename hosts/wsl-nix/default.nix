# ==== WSL-NIX HOST FILE
{hostname, ...}: {
  config = {
    var = {
      # set variables declared in /modules/core/config-host
      inherit hostname;
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
