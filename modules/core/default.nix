# imported from /hosts/default.nix
# every host gets these

{...}: {
  imports = [
    ./core-packages.nix
    ./nh.nix
    ./nix.nix
    ./sops.nix
    ./users.nix
  ];
}
