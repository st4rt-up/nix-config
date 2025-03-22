{ ... }: {
  imports = [
    ./core-packages.nix
    # ./nh.nix # broken rn
    ./nix.nix
    ./users.nix
  ];
}