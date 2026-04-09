{
  lib,
  config,
  ...
}: let
  module-name = "nvim-ts-injections";
  inherit (lib) mkEnableOption mkOption mkIf;
  inherit (lib.types) attrsOf submodule bool str path;
in {
  # imports = [];
  options = {
    ${module-name} = {
      enable = mkEnableOption "Enable";
      configDirectory = mkOption {
        type = path;
        # default = ""; # TODO
      };

      langs = mkOption {
        # description = "";
        type = attrsOf submodule {
          options = {
            /*
            #


            #
            */
            enable = mkOption {
              type = bool;
              default = true;
              # description = "";
            };
            commentPattern = mkOption {
              type = str;
              description = "regex"; # TODO
            };
            queries.aboveline = mkOption {
              type = str;
              # description = "lisp";
            };
            queries.inline = mkOption {
              type = str;
              default = ''
                ; query
                ;; string {name} injection
                ((string_fragment) @injection.content
                                   (#match? @injection.content "{match}")
                                   (#set! injection.language "{name}"))
              '';
              # description = "lisp";
            };
          };
        };
      };
    };
  };
  config =
    mkIf config.${module-name}.enable {
    };
}
