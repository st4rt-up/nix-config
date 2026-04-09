{
  inputs,
  lib,
  ...
}: let
  inherit (lib) mkOption flip mapAttrs mkIf;
  inherit (lib.types) lazyAttrsOf deferredModule submodule unspecified;
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
        cfg =
          (lib.evalModules {
            specialArgs.inputs = inputs;
            modules = [
              {
                options = let
                  optionType = mkOption {
                    type = submodule {
                      freeformType = lazyAttrsOf unspecified;
                    };
                    default = {};
                  };
                in {
                  userConfig = optionType;
                  nixosConfig = optionType;
                };
                config = {
                  userConfig = mkIf (value ? user) {imports = [value.user];};
                  nixosConfig = mkIf (value ? nixos) {imports = [value.nixos];};
                };
              }
            ];
          }).config;

        nixos = {
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
