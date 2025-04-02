{
  config,
  var,
  ...
}: let
  accent = "${config.lib.stylix.colors.base0D}";
  background = "${config.lib.stylix.colors.base00}";
  background-alt = "${config.lib.stylix.colors.base01}";
  foreground = "${config.lib.stylix.colors.base05}";
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
      font-weight: 600;
      font-size: ${builtins.toString font-size}px;
    }

    #network, #battery {
      padding-left: ${builtins.toString gaps-in}px;
      padding-right: ${builtins.toString gaps-in}px;
    }

    #clock {
      margin-right: ${builtins.toString gaps-out}px;
    }

    #window {
      margin-left: ${builtins.toString gaps-out}px;
    }
  '';
}
