{
  nixpkgs,
  self,
  sops-nix,
  nixos-wsl,
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
      inputs.stylix.nixosModules.stylix
      sops-nix.nixosModules.sops
    ];
  };

  wsl-nix = mkHost {
    hostname = "wsl-nix";
    modules = [
      nixos-wsl.nixosModules.default

      inputs.stylix.nixosModules.stylix
      sops-nix.nixosModules.sops
    ];
  };
}
