# currently requires home-manager
{
  username,
  config,
  pkgs,
  ...
}: let
  inherit (config) theme;
in {
  environment.systemPackages = with pkgs; [libnotify];
  home-manager.users.${username} = {
    stylix.targets.mako.enable = false;
    services.mako = {
      enable = true;
      settings = {
        default-timeout = 5 * 1000;

        font = "${theme.fonts.serif.name} 9";

        background-color = "#${theme.colour.base01}";
        border-color = "#${theme.colour.base00}";
        inherit (theme.widgets) border-size;
        border-radius = theme.widgets.rounding;
        inherit (theme.widgets) padding;
      };
    };
  };
}
