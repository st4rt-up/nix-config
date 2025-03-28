{username, ...}: {
  imports = [
    ./nvidia.nix
    ./hardware-configuration.nix
    ./packages.nix

    ../../modules/home-manager

    ../../modules/nixos/audio.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/wayland.nix

    ../../modules/nixos/gnome
  ];

  security.sudo.extraConfig = ''
    Defaults    env_keep+=SSH_AUTH_SOCK
  '';

  programs.ssh.startAgent = true;
  home-manager.users."${username}" = import ./home.nix {inherit username;};
  # programs.home-manager.enable = true;

  system.stateVersion = "24.11";
}
