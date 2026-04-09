{inputs, ...}: {
  modules.nix-settings.nixos = {
    nix.settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      keep-going = true;
    };

    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };
}
