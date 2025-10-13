{
  username,
  config,
  ...
}: let
  inherit (config) theme;
in let
  # accent = theme.colour.base0D;
  # background = theme.colour.base00;
  # background-alt = theme.colour.base01;
  # foreground = theme.colour.base05;
  #temp
  accent = theme.colour.base0F;
  # charged-color = theme.colour.base0B;

  font = theme.fonts.monospace.name;
  # rounding = theme.rounding;
  font-size = config.stylix.fonts.sizes.desktop;
in {
  home-manager.users.${username} = {
    # maybe make this imported in style ... ?
    programs.waybar.style = ''
      * {
        font-family: "${font}";
        font-weight: 500;
        font-size: ${toString font-size}px;
      }

      #network, #battery {
        padding-left: ${toString theme.gaps-out}px;
        padding-right: ${toString theme.gaps-in}px;
      }

      #battery.plugged, #battery.charging {
        color: #${theme.colour.primary};
      }

      #battery.warning {
        color: #${theme.colour.yellow};
      }

      #battery.critical {
        color: #${theme.colour.red};
      }

      #clock {
        margin-right: ${toString theme.gaps-out}px;
      }

      #window {
        margin-left: ${toString theme.gaps-out}px;
      }

      #wireplumber.muted {
        color: #${toString accent}
      }
    '';
  };
}
