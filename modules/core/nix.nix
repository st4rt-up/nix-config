{inputs, ...}: {
  nix = {
    settings.experimental-features = ["nix-command" "flakes"];

    # used for lsps
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };

  programs.nix-ld.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/kai/nix-config";
  };
}
