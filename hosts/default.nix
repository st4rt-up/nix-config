# pattern inspired by sioodmy,
# https://github.com/sioodmy/dotfiles/blob/main/hosts/default.nix
# allows for easy
{
  nixpkgs,
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
          ./../modules/core
          ./${hostname}
        ]
        ++ modules;
    };
in {
  laptop = mkHost {hostname = "laptop";};

  wsl-nix = mkHost {
    hostname = "wsl-nix";
    modules = [
      nixos-wsl.nixosModules.default
    ];
  };
}
