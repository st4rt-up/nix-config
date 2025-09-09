{
  config,
  theme,
  var,
  ...
}: let
  # accent = theme.colour.base0D;
  background = theme.colour.base00;
  background-alt = theme.colour.base01;
  foreground = theme.colour.base05;

  #temp
  accent = theme.colour.base0F;
  red = theme.colour.red;
  yellow = theme.colour.yellow;
  charged-color = theme.colour.base0B;

  font = theme.fonts.monospace.name;
  rounding = theme.rounding;
  font-size = config.stylix.fonts.sizes.desktop;
  gaps-out = theme.gaps-out;
  gaps-in = theme.gaps-in;
in {
  # maybe make this imported in style ... ?
  programs.waybar.style = ''
    * {
      font-family: "${font}";
      font-weight: 500;
      font-size: ${toString font-size}px;
    }

    #network, #battery {
      padding-left: ${toString gaps-in}px;
      padding-right: ${toString gaps-in}px;
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
      margin-right: ${toString gaps-out}px;
    }

    #window {
      margin-left: ${toString gaps-out}px;
    }

    #wireplumber.muted {
      color: #${toString accent}
    }
  '';
}
