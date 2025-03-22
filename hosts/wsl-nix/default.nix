{username, ...}: {
  imports = [
    ../../modules/home-manager
    ./hardware-configuration.nix
    ./configuration.nix
  ];

  home-manager.users."${username}" = import ./home.nix {inherit username;};

  system.stateVersion = "24.11";
}
