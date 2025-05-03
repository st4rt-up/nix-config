{
  nixpkgs,
  self,
  sops-nix,
  ...
}: let
  inherit (self) inputs;
  flake = self;

  mkHost = {
    hostname,
    system ? "x86_64-linux",
    modules ? [],
  }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs system flake hostname;};

      modules =
        [
          # {_module.args = {inherit inputs system flake;};}
          ./../modules/core
          ./${hostname}
        ]
        ++ modules;
    };
in {
  laptop = mkHost {
    hostname = "laptop";
    modules = [
      # inputs.home-manager.nixosModules.home-manager
      inputs.stylix.nixosModules.stylix
      sops-nix.nixosModules.sops
    ];
  };

  wsl = mkHost {
    hostname = "wsl-nix";
    modules = [
      inputs.home-manager.nixosModules.home-manager
      inputs.stylix.nixosModules.stylix
    ];
  };
}
