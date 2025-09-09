{
  config,
  theme,
  ...
}: let
  font = config.stylix.fonts.sansSerif.name;
  font-size = config.stylix.fonts.sizes.popups;

  background = "#${config.lib.stylix.colors.base00}";
  accent = "#${config.lib.stylix.colors.base0D}";

  gaps-in = theme.gaps-in;
  gaps-out = theme.gaps-out;

  rounding = theme.rounding;
in {
  stylix.targets.mako.enable = false;
  services.mako = {
    enable = true;
    settings = {
      default-timeout = 5 * 1000;

      font = "${font} 11";

      background-color = background;
      border-color = accent;
      border-radius = rounding;

      padding = "${toString gaps-in}";
    };
  };
}
