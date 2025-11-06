{
  config,
  # username,
  ...
}: let
  inherit (config) theme;
in {
  stylix = {
    enable = theme.enableStylix;

    base16Scheme = {
      inherit (theme.colour) base01 base00 base02 base03 base04 base05 base06 base07 base08 base09 base0A base0B base0C base0D base0E base0F;
    };

    fonts = {
      inherit (theme.fonts) monospace sansSerif serif emoji;
      sizes = {
        inherit (theme.fonts.sizes) applications desktop popups terminal;
      };
    };
  };
}
