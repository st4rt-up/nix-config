{
  config,
  pkgs,
  theme,
  ...
}: let
  font = theme.fonts.monospace.name;
  font-size = theme.fonts.sizes.desktop;
  background = theme.colour.background;

  border-color = theme.colour.background;
  opacity = theme.inactive-opacity;
  border-size = theme.border-size;
  radius = theme.rounding;
in {
  home.packages = with pkgs; [wofi];

  stylix.targets.wofi.enable = false;
  wayland.windowManager.hyprland.settings.bind = [
    "$mainMod, space, exec, pkill wofi || wofi --show drun --sort-order=alphabetical "
  ];

  programs.wofi = {
    enable = true;

    settings = {
      mode = "drun";

      show_all = false;

      # allow_images = true;
      # print_command = true;
      insensitive = true;
    };

    style = ''

      @define-color background #${toString theme.colour.background};
      @define-color background-alt #${toString theme.colour.background-alt};
      @define-color border #${toString theme.colour.background};

      * {
        font-family: ${font};
        font-size: ${toString font-size}px;
      }

      window {
        background-color: @background;

        border-radius: ${toString radius}px;
        border: ${toString border-size}px solid @border;
      }
    '';
  };
}
