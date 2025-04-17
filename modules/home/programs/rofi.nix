{
  config,
  pkgs,
  ...
}: let
  background = config.stylix.base16Scheme.base00;
  foreground = config.stylix.base16Scheme.base0B;
  border = config.stylix.base16Scheme.base02;

  inherit (config.lib.formats.rasi) mkLiteral;
in {
  home.packages = with pkgs; [
    rofi-wayland
  ];

  stylix.targets.rofi.enable = false;
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    location = "center";

    theme = {
      "*" = {
        background-color = mkLiteral background;
        foreground-color = mkLiteral foreground;
        border-color = mkLiteral border;
      };
    };
  };
}
