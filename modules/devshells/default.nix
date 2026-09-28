{inputs, ...}: let
  supportedSystems = [
    "x86_64-linux"
    "aarch64-linux"
    "x86_64-darwin"
    "aarch64-darwin"
  ];
  forEachSupportedSystem = f:
    inputs.nixpkgs.lib.genAttrs supportedSystems
    (system: f {pkgs = import inputs.nixpkgs {inherit system;};});
in {
  flake.devShells = forEachSupportedSystem (
    {pkgs}: {
      default = pkgs.mkShell {
        # env = {};
        # inputsFrom = [];
        # shellHook = '' '';
        packages = with pkgs;
          [
            git
            ripgrep
            just
            libnotify

            nh
            deadnix
            nix-diff
            nix-tree
          ]
          ++ inputs.nixpkgs.lib.optional (stdenv.hostPlatform.system != "aarch64-darwin") [
          ];
      };
    }
  );
}
