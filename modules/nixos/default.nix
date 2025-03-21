{...}: {
  imports = [
    ./audio.nix
    ./boot.nix
    ./core-packages.nix
    ./fonts.nix
    ./users.nix
    ./wayland.nix
  ];
}
