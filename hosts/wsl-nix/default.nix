{username, ...}: {
  imports = [
    ../../modules/home-manager
    ./hardware-configuration.nix
  ];

  home-manager.users."${username}" = import ./home.nix {inherit username;};
}
