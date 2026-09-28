{lib, ...}: let
  inherit (lib) mkOption;
  inherit (lib.types) lazyAttrsOf submodule deferredModule unspecified;
in {
  options = {
    modules = mkOption {
      # .<name>
      type =
        lazyAttrsOf (lazyAttrsOf deferredModule)
        /*
        (
          submodule {
            # .<type>
            freeformType = lazyAttrsOf deferredModule;
          }
        )
        */
        ;
    };
    flake = mkOption {
      type = lazyAttrsOf unspecified;
      default = {};
    };
  };
}
