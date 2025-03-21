{
  description = "hello world"; 

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.11"; # update manually

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  # nixConfig = {};

  outputs = inputs@{ ... }: { 
    nixosConfigurations = import ./hosts inputs;
  };

}