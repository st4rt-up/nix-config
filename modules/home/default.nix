{
  config,
  inputs,
  system,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    # ./programs/home-manager.nix
  ];

  home-manager = {
    users."${config.var.username}" =
      import ./users/${config.var.username}.nix;
    extraSpecialArgs = {
      inherit inputs system;
      var = config.var;
    };

    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "hmbackup";
  };
}
