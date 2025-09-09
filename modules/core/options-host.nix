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
      default = "America/Toronto";
    };

    shell = lib.mkOption {
      type = lib.types.str;
      default = "bash";
    };

    # === GUI SPECFIC

    gui = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

    terminal = lib.mkOption {
      type = lib.types.str;
      default = "kitty";
    };

    # for use with wallpaper daemon
    # relative path

    wallpaper = lib.mkOption {
      type = lib.types.str;
      default = null;
    };

    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
