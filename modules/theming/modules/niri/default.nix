{
  username,
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf mkOption;
  inherit (config) theme;
  inherit (lib.types) bool;

  link = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;

  mkOpt = type: default:
    mkOption {
      inherit type default;
    };
in {
  options.theme = {
    niri = {
      enable = mkOpt bool false;
      focus-ring = mkOpt bool false;
      border = mkOpt bool true;
    };
  };

  config = mkIf config.theme.niri.enable {
    home-manager.users.${username} = {
      xdg.configFile = mkIf config.programs.niri.enable {
        "niri/config.kdl".text = "include \"generated-theme.kdl\"";
        "niri/generated-theme.kdl".source = link (pkgs.writeText "./generated-theme.kdl" ''
          layout {
            gaps ${toString theme.window-manager.gaps.inside}

            struts {
              left ${toString theme.window-manager.gaps.outside}
              right ${toString theme.window-manager.gaps.outside}
            }

            focus-ring {
              ${
            if theme.niri.focus-ring
            then "on"
            else "off"
          }
              active-color "#${theme.window-manager.border.colour.active}"
              width ${toString theme.window-manager.border.size}
            }

            border {
              ${
            if theme.niri.border
            then "on"
            else "off"
          }
              width ${toString theme.window-manager.border.size}
              active-color "#${theme.window-manager.border.colour.active}"
              inactive-color "#${theme.window-manager.border.colour.inactive}"
            }

            shadow {
              ${
            if theme.window-manager.shadow.enable
            then "on"
            else "off"
          }
            }
          }

          window-rule { // rounding
            geometry-corner-radius ${toString theme.window-manager.rounding}
          }

          window-rule { // active opacity
            match is-active=true
            opacity ${toString theme.window-manager.opacity.active}
          }

          window-rule { // inactive opacity
            match is-active=false
            opacity ${toString theme.window-manager.opacity.inactive}
          }

        '');
      };
    };
  };
}
