{
  username,
  pkgs,
  config,
  ...
}: let
  inherit (config) theme;
  # background = theme.colour.background;
  # border-color = theme.colour.background;
  # opacity = theme.inactive-opacity;
in {
  home-manager.users.${username} = {
    stylix.targets.wofi.enable = false;
    # wayland.windowManager.hyprland.settings.bind = [
    #  "$mainMod, space, exec, pkill wofi || wofi --show drun --sort-order=alphabetical "
    # ];

    home.packages = with pkgs; [wofi];

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
          font-family: ${theme.fonts.monospace.name};
          font-size: ${toString theme.fonts.sizes.desktop}px;
        }

        window {
          background-color: @background;

          border-radius: ${toString theme.rounding}px;
          border: ${toString theme.border-size}px solid @border;
        }
      '';
    };
  };
}
