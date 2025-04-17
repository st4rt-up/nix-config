{
  config,
  pkgs,
  ...
}: let
  font = config.stylix.fonts.monospace.name;
  font-size = config.stylix.fonts.sizes.popups + 5;
  background = "${config.lib.stylix.colors.base00}";

  border-color = "${config.lib.stylix.colors.base0B}";
  opacity = config.theme.inactive-opacity;
  border = config.theme.border-size;
  radius = config.theme.rounding;
in {
  home.packages = with pkgs; [wofi];

  stylix.targets.wofi.enable = false;
  wayland.windowManager.hyprland.settings.bind = [
    "$mainMod, r, exec, pkill wofi || wofi --show drun"
  ];

  programs.wofi = {
    enable = true;

    settings = {
      mode = "drun";

      show_all = false;

      insensitive = true;
    };

    style = ''

      * {
        font-family: ${font};
        font-size: ${toString font-size}px;
      }

      window {
        background-color: ${background};
        opacity: ${toString opacity};

        border-radius: ${toString radius}px;
        border: ${toString border}px solid ${border-color};
      }
    '';
  };
}
