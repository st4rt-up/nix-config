{
  inputs,
  config,
  lib,
  ...
}: let
  inherit (lib) mkOption flip mapAttrs mkIf;
  inherit (lib.types) lazyAttrsOf deferredModule submodule;
in {
  options.configurations.home = mkOption {
    type = lazyAttrsOf (submodule {
      freeformType = lazyAttrsOf (submodule {
        freeformType = deferredModule;
      });
    });

    apply = outputs: (flip mapAttrs outputs (
      name: value: (
        # inputs.home-manager.lib.homeManagerConfiguration { })
        {
          # home = mkIf (value ? home) value.home;
          nixos = {
            # yeah man just make it a nixos module who even cares
            imports = [inputs.home-manager.nixosModules.home-manager];
            users.users.${name} = {
              inherit name;
              description = name;
              isNormalUser = true;
            };

            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              backupFileExtension = "hmbackup";
            };

            home-manager.users.${name} =
              {
                home.username = name;
                home.stateVersion = "24.11";
                programs.home-manager.enable = true;
              }
              // mkIf (value ? home) value.home;
          };
        }
      )
    ));
  };

  /*
  config.flake.homeConfigurations = flip mapAttrs config.configurations.home (
    name: value: (inputs.home-manager.lib.homeManagerConfiguration {})
  );
  */
}
