{nixpkgs, ...}
#@ inputs
: let
  inherit (nixpkgs.lib) optional;
  supportedSystems = [
    "x86_64-linux"
    "aarch64-linux"
    "x86_64-darwin"
    "aarch64-darwin"
  ];
  forEachSupportedSystem = f:
    nixpkgs.lib.genAttrs supportedSystems
    (system:
      f {
        pkgs = import nixpkgs {inherit system;};
      });
in
  forEachSupportedSystem ({pkgs}: {
    default = pkgs.mkShell {
      # env = {};
      # inputsFrom = [];
      # shellHook = '' '';
      packages = with pkgs;
        [
          just
          nh
        ]
        ++ optional (stdenv.hostPlatform.system != "aarch64-darwin") [];
    };
  })
