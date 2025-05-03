{
  config,
  pkgs,
  theme,
  ...
}: let
  font = theme.fonts.monospace.name;
  font-size = theme.fonts.sizes.popups + 5;
  background = theme.colour.background;

  border-color = theme.colour.background;
  opacity = theme.inactive-opacity;
  border = theme.border-size;
  radius = theme.rounding;
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

        border-radius: ${toString radius}px;
        border: ${toString border}px solid ${border-color};
      }
    '';
  };
}
