{
  username,
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf mkOption mkDefault;
  inherit (config) theme;
  inherit (lib.types) bool;
in {
  options.theme = {
    mako.enable = mkOption {
      type = bool;
      default = false;
    };
  };

  config = mkIf config.theme.mako.enable {
    home-manager.users.${username}.services.mako.settings = {
      font = mkDefault "${theme.widgets.notification.font.name} ${toString theme.widgets.notification.font.size}";

      background-color = mkDefault "#${theme.colour.background-alt}";

      border-color = mkDefault "#${theme.colour.background}";
      border-size = mkDefault theme.widgets.border.size;
      border-radius = mkDefault theme.widgets.rounding;

      padding = mkDefault theme.widgets.padding;

      max-icon-size = mkDefault theme.widgets.notification.icon.size;

      width = mkDefault theme.widgets.notification.width;
      height = mkDefault theme.widgets.notification.height;
    };
  };
}
