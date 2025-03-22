{
  inputs,
  system,
  flake,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      inherit inputs system flake;
    };

    useUserPackages = true;
    useGlobalPkgs = true;
  };

  # programs.home-manager.enable = true;
}
