{
  config,
  username,
  ...
}: let
  theme = config.theme;
in {
  stylix = {
    enable = theme.enableStylix;

    base16Scheme = {
      base01 = theme.colour.base01;
      base00 = theme.colour.base00;
      base02 = theme.colour.base02;
      base03 = theme.colour.base03;

      base04 = theme.colour.base04;
      base05 = theme.colour.base05;
      base06 = theme.colour.base06;
      base07 = theme.colour.base07;

      base08 = theme.colour.base08;
      base09 = theme.colour.base09;
      base0A = theme.colour.base0A;
      base0B = theme.colour.base0B;

      base0C = theme.colour.base0C;
      base0D = theme.colour.base0D;
      base0E = theme.colour.base0E;
      base0F = theme.colour.base0F;
    };

    fonts = let
      cfgFonts = theme.fonts;
    in {
      monospace = {
        package = cfgFonts.monospace.package;
        name = cfgFonts.monospace.name;
      };
      sansSerif = {
        package = cfgFonts.sansSerif.package;
        name = cfgFonts.sansSerif.name;
      };
      serif = {
        package = cfgFonts.serif.package;
        name = cfgFonts.serif.name;
      };
      emoji = {
        package = cfgFonts.emoji.package;
        name = cfgFonts.emoji.name;
      };

      sizes = {
        applications = cfgFonts.sizes.applications;
        desktop = cfgFonts.sizes.desktop;
        popups = cfgFonts.sizes.popups;
        terminal = cfgFonts.sizes.terminal;
      };
    };
  };
}
