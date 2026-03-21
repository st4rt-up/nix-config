{
  lib,
  config,
  ...
}: let
  inherit
    (lib)
    flip
    mapAttrs
    mkOption
    nixosSystem
    ;
  inherit (lib.types) deferredModule;
in {
  options = {
    configurations = {
      nixos = mkOption {
        type = deferredModule;
        default = {};
      };
      home = mkOption {
        type = deferredModule;
        default = {};
      };
      /*
      darwin = mkOption {
        type = deferredModule;
        default = {}
      };
      */
      devShells = mkOption {
        type = deferredModule;
        default = {};
      };
      host = mkOption {
        type = deferredModule;
        default = {};
      };
    };
  };

  config = {
    nixosConfigurations = flip mapAttrs config.configurations.hosts (
      name: {module}:
        nixosSystem {
          modules = [
            module
            {networking.hostName = name;}
          ];
        }
    );

    jhomes = flip mapAttrs config.configurations.home (
      name: {module}:
        home {}
    );
  };
}
