{
  config,
  var,
  ...
}: let
  accent = "${config.lib.stylix.colors.base0D}";
  background = "${config.lib.stylix.colors.base00}";
  background-alt = "${config.lib.stylix.colors.base01}";
  foreground = "${config.lib.stylix.colors.base05}";

  #temp
  red = "${config.lib.stylix.colors.base0F}";
  yellow = "${config.lib.stylix.colors.base08}";
  charged-color = "${config.lib.stylix.colors.base0B}";

  font = config.stylix.fonts.monospace.name;
  rounding = config.theme.rounding;
  font-size = config.stylix.fonts.sizes.popups;
  gaps-out = config.theme.gaps-out;
  gaps-in = config.theme.gaps-in;
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
      color: #${toString accent};
    }

    #battery.warning {
      color: #${toString yellow};
    }

    #battery.critical {
      color: #${toString red};
    }

    #clock {
      margin-right: ${toString gaps-out}px;
    }

    #window {
      margin-left: ${toString gaps-out}px;
    }

    #wireplumber.muted {
      color: #${toString red}
    }
  '';
}
