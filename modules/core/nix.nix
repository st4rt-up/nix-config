{
  inputs,
  config,
  ...
}: let
  inherit (inputs) nix-index-database;
in {
  imports = [
    nix-index-database.nixosModules.nix-index
  ];

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      keep-going = true;
    };

    # used for lsps
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = config.var.flake-path;
    };

    nix-index-database.comma.enable = true;
    nix-ld.enable = true;
  };
}
