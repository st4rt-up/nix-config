{
  username,
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkIf mkOption;
  inherit (config) theme;
  inherit (lib.types) bool enum;

  mkOpt = type: default:
    mkOption {
      inherit type default;
    };

  link = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
in {
  options.theme = {
    rofi = {
      enable = mkOpt bool false;

      location = mkOpt (enum ["north" "northeast" "northwest" "south" "southeast" "southwest" "east" "west" "center"]) "northeast";
      anchor = mkOpt (enum ["north" "northeast" "northwest" "south" "southeast" "southwest" "east" "west" "center"]) "northeast";
    };
  };

  config = mkIf config.theme.rofi.enable {
    home-manager.users.${username} = {
      xdg.configFile = mkIf config.home-manager.users.${username}.programs.rofi.enable {
        "rofi/config.rasi".text = "@import \"generated-theme.rasi\"";
        "rofi/generated-theme.rasi".source = link (pkgs.writeText "./generated-theme.rasi" ''
          * {
            background-color: #${theme.colour.background-alt}FF;
            lightfg: #${theme.colour.foreground}FF;
            lightbg: #${theme.colour.background-alt}FF;
            foreground: #${theme.colour.foreground}FF;
            background: #${theme.colour.background-alt}FF;

            font: "${theme.launcher.font.name} ${toString theme.launcher.font.size}";
          }

          window {
            location: "${theme.rofi.location}";
            anchor: "${theme.rofi.anchor}";
          }
        '');
      };
    };
  };
}
