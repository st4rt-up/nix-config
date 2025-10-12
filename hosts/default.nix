{
  nixpkgs,
  sops-nix,
  self,
  nixos-wsl,
  ...
} @ inputs: let
  mkHost = {
    hostname,
    system ? "x86_64-linux",
    modules ? [],
  }:
  # helper function
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs system hostname;
        flake = self;
      };

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
