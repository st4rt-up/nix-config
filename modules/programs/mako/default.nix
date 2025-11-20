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

        font = "${theme.fonts.sansSerif.name} 11";

        background-color = "#${theme.colour.base00}";
        border-color = "#${theme.colour.base0D}";
        border-radius = theme.rounding;

        padding = "${toString theme.gaps-in}";
      };
    };
  };
}
