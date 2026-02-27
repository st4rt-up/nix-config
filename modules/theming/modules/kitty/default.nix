{
  config,
  username,
  lib,
  ...
}: let
  inherit (config) theme;
  inherit (lib) mkForce mkIf mkOption;
  inherit (lib.types) bool;
in {
  options.theme = {
    kitty.enable = mkOption {
      type = bool;
      default = false;
    };
  };
  config = mkIf config.theme.mako.enable {
    home-manager.users.${username} = {
      programs.kitty.settings = {
        font_size = theme.fonts.sizes.terminal;
        font_family = theme.fonts.monospace.name;

        background_opacity = mkForce (toString theme.window-manager.opacity.active);
        background_blur =
          if theme.window-manager.blur.enable
          then 1
          else 0;
      };
    };
  };
}
