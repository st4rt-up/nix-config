{config, ...}: let
  font = config.stylix.fonts.sansSerif.name;
  font-size = config.stylix.fonts.sizes.popups;

  background = "#${config.lib.stylix.colors.base00}";
  accent = "#${config.lib.stylix.colors.base0D}";

  gaps-in = config.theme.gaps-in;
  gaps-out = config.theme.gaps-out;

  rounding = config.theme.rounding;
in {
  stylix.targets.mako.enable = false;
  services.mako = {
    enable = true;

    defaultTimeout = 5 * 1000;

    font = "${font} 11";

    backgroundColor = background;
    borderColor = accent;
    borderRadius = rounding;

    padding = "${toString gaps-in}";
  };
}
