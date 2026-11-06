{
  inputs,
  lib,
  ...
}: let
  inherit (lib) mkOption flip mapAttrs mkIf mkMerge optionalAttrs;
  inherit (lib.types) lazyAttrsOf deferredModule submodule unspecified bool;
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
              pkgs = import inputs.nixpkgs {system = "x86_64-linux";};
              inherit inputs;
            };
            modules = [
              {
                options = {
                  "userConfig" = optionType;
                  "nixosConfig" = optionType;
                  "homeConfig" = optionType;
                };

                config = {
                  "userConfig" = _: {
                    imports = [
                      {
                        options.home-manager.enable = mkOption {
                          type = bool;
                          default = false;
                        };
                      }
                      (optionalAttrs (value ? user) value.user)
                    ];
                  };
                  "nixosConfig" = mkIf (value ? nixos) value.nixos;
                  "homeConfig" = mkIf (value ? home) value.home;
                };
              }
            ];
          }).config;

        nixos.config = {
          users.mutableUsers = true;
          users.users.${name} =
            {
              inherit name;
              description = name;
              isNormalUser = true;
            }
            // removeAttrs cfg.userConfig ["home-manager"];
        };
      in {
        inherit (cfg) userConfig nixosConfig homeConfig; # for convenience? but will remove if it impacts eval times too much
        withoutNixosConfig = nixos;
        withNixosConfig = nixos // cfg.nixosConfig; # redundant but makes it clear
        # if nothing specified, default to importing nixosConfig
        nixos = mkMerge [
          (nixos // cfg.nixosConfig)
          (
            mkIf cfg.userConfig.home-manager.enable {
              imports = [inputs.home-manager.nixosModules.default];
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                backupFileExtension = "hmbackup";
              };
              home-manager.users.${name} =
                {
                  home.username = name;
                  home.stateVersion = "26.05";
                  programs.home-manager.enable = true;
                }
                // cfg.homeConfig;
            }
          )
        ];
      }
    ));
  };
}
