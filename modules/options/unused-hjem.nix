{lib, ...}: let
  inherit (lib) mkOption flip mapAttrs mkIf;
  inherit (lib.types) lazyAttrsOf deferredModule submodule;
in {
  options.configurations.hjem = mkOption {
    type = lazyAttrsOf (submodule {
      freeformType = lazyAttrsOf (submodule {
        freeformType = deferredModule;
      });
    });
  };
}
