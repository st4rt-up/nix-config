{inputs, ...}: {
  nix = {
    settings.experimental-features = ["nix-command" "flakes"];

    nixPath = [
      "nixpkgs=${inputs.nixpkgs}"
    ];
  };
}
