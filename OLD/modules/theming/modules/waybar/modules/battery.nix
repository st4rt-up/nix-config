{
  username,
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf mkOption;
  inherit (config) theme;
  inherit
    (lib.types)
    # bool
    # int
    str
    ;

  link = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;

  mkOpt = type: default:
    mkOption {
      inherit type default;
    };
in {
  options.theme = {
    waybar.battery = {
      # enable = mkOpt bool false;
      colour = {
        plugged = mkOpt str theme.colour.primary;
        charging = mkOpt str theme.colour.primary;
        warning = mkOpt str theme.colour.yellow;
        critical = mkOpt str theme.colour.red;
      };
    };
  };

  config = mkIf config.home-manager.users.${username}.programs.waybar.enable {
    home-manager.users.${username} = {
      xdg.configFile = {
        "waybar/generated-theme-battery.jsonc".source = link (pkgs.writeText "./generated-theme.battery.jsonc" ''
          #battery.plugged {
            color: #${theme.waybar.battery.colour.plugged};
          }
          #battery.charging {
            color: #${theme.waybar.battery.colour.charging};
          }
          #battery.warning {
            color: #${theme.waybar.battery.colour.warning};
          }
          #battery.critical {
            color: #${theme.waybar.battery.colour.critical};
          }
        '');
      };
    };
  };
}
