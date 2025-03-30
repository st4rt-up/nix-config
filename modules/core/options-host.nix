{
  config,
  pkgs,
  lib,
  ...
}: {
  # thanks
  # https://www.reddit.com/r/NixOS/comments/1jkco6c/configurationwide_variables_in_nixos/

  options.var = {
    username = lib.mkOption {
      type = lib.types.str;
      default = "nixos";
    };

    hostname = lib.mkOption {
      type = lib.types.str;
      default = "nixos";
    };

    locale = lib.mkOption {
      type = lib.types.str;
      default = "en_US.UTF-8";
    };

    timezone = lib.mkOption {
      type = lib.types.str;
      default = "America/New_York";
    };

    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
