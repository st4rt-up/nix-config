{lib, ...}: let
  inherit (lib) mkOption types;
in {
  # thanks
  # https://www.reddit.com/r/NixOS/comments/1jkco6c/configurationwide_variables_in_nixos/

  options = {
    var = {
      hostname = mkOption {
        type = types.str;
        default = "nixos";
      };

      locale = mkOption {
        type = types.str;
        default = "en_US.UTF-8";
      };

      timezone = mkOption {
        type = types.str;
        default = "America/Toronto";
      };

      shell = mkOption {
        type = types.str;
        default = "bash";
      };

      secrets = mkOption {
        type = types.bool;
        default = false;
      };

      # === HELPER

      flake-path = mkOption {
        type = types.str;
      };

      config-directory = mkOption {
        type = types.str;
        default = "~/nix-config";
      };

      files-directory = mkOption {
        type = types.str;
        default = "~/files";
      };
      # === GUI SPECFIC

      gui = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };
}
