{username, ...}: {
  imports = [
    ../../modules/home-manager
    ./nvidia.nix
    ./hardware-configuration.nix

    ../../modules/nixos/audio.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/users.nix
  ];

  home-manager.users."${username}" = import ./home.nix {inherit username;};
  # programs.home-manager.enable = true;
}
