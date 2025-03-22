{
  nixpkgs,
  self,
  home-manager,
  nixos-wsl,
  ...
}:
# assumed same username in every system
let
  username = "kai";
in let
  inherit (self) inputs;
  flake = self;

  mkHost = {
    hostname,
    system ? "x86_64-linux",
    modules ? [],
  }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs system username flake;};

      modules =
        [
          {
            _module.args = {inherit inputs;};
            networking.hostName = hostname;
            nixpkgs.hostPlatform = system;
            nixpkgs.config.allowUnfree = true;
          }
          ./../modules/core
          ./${hostname}
        ]
        ++ modules;
    };
in {
  laptop-nix = mkHost {
    hostname = "laptop-nix";
    modules = [
      home-manager.nixosModules.home-manager
      {
        home-manager.extraSpecialArgs = {inherit inputs flake;};
      }
    ];
  };

  wsl-nix = mkHost {
    hostname = "wsl-nix";
    modules = [
      nixos-wsl.nixosModules.default
      home-manager.nixosModules.home-manager
    ];
  };
}
