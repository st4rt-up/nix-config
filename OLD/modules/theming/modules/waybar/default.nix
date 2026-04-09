{
  username,
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf mkOption;
  inherit (config) theme;
  inherit (lib.types) bool int;

  link = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;

  mkOpt = type: default:
    mkOption {
      inherit type default;
    };
in {
  options.theme = {
    waybar = {
      enable = mkOpt bool false;
      padding-in = mkOpt int (theme.bar.spacing * 2);
      padding-out = mkOpt int theme.bar.spacing;
    };
  };

  config = mkIf config.home-manager.users.${username}.programs.waybar.enable {
    home-manager.users.${username} = {
      xdg.configFile = {
        "waybar/config.jsonc".source = link pkgs.writeText "./config.jsonc" ''
          * {
            --font: "${theme.bar.font.name}";
            --font-size: ${toString theme.bar.font.size}px;
            --padding-in: ${toString theme.waybar.padding-in}px;
            --padding-out: ${toString theme.waybar.padding-out}px;
          }
        '';
      };
    };
  };
}
