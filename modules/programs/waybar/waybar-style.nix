{
  username,
  config,
  ...
}: let
  inherit (config) theme;
  # accent = theme.colour.base0D;
  # background = theme.colour.base00;
  # background-alt = theme.colour.base01;
  # foreground = theme.colour.base05;
  #temp
  accent = theme.colour.base0F;
  # charged-color = theme.colour.base0B;

  font = theme.fonts.monospace.name;
  font-size = theme.fonts.sizes.desktop;

  padding-out = toString (theme.bar.spacing * 2);
  padding-in = toString theme.bar.spacing;
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
        padding-left: ${padding-in}px;
        padding-right: ${padding-out}px;
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
        margin-right: ${padding-out}px;
      }

      #window {
        margin-left: ${padding-out}px;
      }

      #wireplumber.muted {
        color: #${toString accent}
      }
    '';
  };
}
