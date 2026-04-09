{
  inputs,
  config,
  lib,
  ...
}: let
  inherit (lib) mkOption flip mapAttrs optionalAttrs pipe mkMerge mapAttrsToList;
  inherit (lib.types) lazyAttrsOf deferredModule submodule;
in {
  options.configurations.nixos = mkOption {
    type = lazyAttrsOf (submodule {
      # name
      freeformType = lazyAttrsOf (submodule {
        freeformType = deferredModule;
      });
    });
    # hacky fix do NOT question
    apply = outputs: (flip mapAttrs outputs (
      name: cfg: (inputs.nixpkgs.lib.nixosSystem {
        specialArgs.inputs = inputs;
        modules = [
          cfg.nixos
          # (optionalAttrs (cfg ? nixos) cfg.nixos)
          {networking.hostName = name;}
        ];
      })
    ));
  };
  config.flake = {
    nixosConfigurations = config.configurations.nixos;
    checks =
      pipe
      config.configurations.nixos [
        (mapAttrsToList (
          name: nixos: {
            ${nixos.config.nixpkgs.hostPlatform.system} = {
              "configurations:nixos:${name}" = nixos.config.system.build.toplevel;
            };
          }
        ))
        mkMerge
      ];
  };
}
