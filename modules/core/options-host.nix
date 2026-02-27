{lib, ...}: let
  inherit (lib) mkOption;

  inherit (lib.types) str bool;
  mkOpt = type: default:
    mkOption {
      inherit type default;
    };
  mkOptNoDefault = type: mkOption {inherit type;};
in {
  # thanks
  # https://www.reddit.com/r/NixOS/comments/1jkco6c/configurationwide_variables_in_nixos/

  options = {
    var = {
      hostname = mkOpt str "nixos";
      locale = mkOpt str "en_US.UTF-8";
      timezone = mkOpt str "America/Toronto";

      shell = mkOpt str "bash";

      gui = mkOpt bool false;
      secrets = mkOpt bool false;

      path = {
        config = mkOptNoDefault str;
        flake = mkOpt str "~/nix-config";
        files = mkOpt str "~/files";
      };
    };
  };
}
