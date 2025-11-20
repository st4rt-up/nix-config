{
  inputs,
  lib,
  ...
}: let
  inherit (lib) optional;
  supportedSystems = [
    "x86_64-linux"
    "aarch64-linux"
    "x86_64-darwin"
    "aarch64-darwin"
  ];
  forEachSupportedSystem = f:
    inputs.nixpkgs.lib.genAttrs supportedSystems
    (system: f {pkgs = import inputs.nixpkgs {inherit system;};});
in
  forEachSupportedSystem ({pkgs}: {
    default = pkgs.mkShellOverride {} {
      # env = {};
      # inputsFrom = [];
      # shellHook = '' '';
      packages = with pkgs;
        [
          just
          nh
        ]
        ++ optional (system != "aarch64-darwin") [];
    };
  })
