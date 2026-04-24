{
  inputs,
  lib,
  ...
}: let
  inherit (lib) mkOption flip mapAttrs mkIf;
  inherit (lib.types) lazyAttrsOf deferredModule submodule unspecified anything;
in {
  options.configurations.users = mkOption {
    type = lazyAttrsOf (submodule {
      freeformType = lazyAttrsOf (submodule {
        freeformType = deferredModule;
      });
    });
    # hacky fix do NOT question
    apply = outputs: (flip mapAttrs outputs (
      name: value: let
        cfg = let
          optionType = mkOption {
            type = submodule {
              freeformType = lazyAttrsOf unspecified;
            };
          };
        in
          (lib.evalModules {
            specialArgs = {
              inherit inputs;
              pkgs = import inputs.nixpkgs {system = "x86_64-linux";};
            };
            modules = [
              {
                options = {
                  userConfig = optionType;
                  nixosConfig = optionType;
                };
                config = {
                  userConfig = mkIf (value ? user) (_: {imports = [value.user];});
                  nixosConfig = mkIf (value ? nixos) value.nixos;
                };
              }
            ];
          }).config;

        nixos = {
          users.mutableUsers = true;
          users.users.${name} =
            {
              inherit name;
              description = name;
              isNormalUser = true;
            }
            // cfg.userConfig;
        };
      in {
        inherit (cfg) userConfig nixosConfig; # for convenience? but will remove if it impacts eval times too much
        withoutNixosConfig = nixos;
        withNixosConfig = nixos // cfg.nixosConfig; # redundant but makes it clear
        # if nothing specified, default to importing nixosConfig
        nixos = nixos // cfg.nixosConfig;
      }
    ));
  };
}
