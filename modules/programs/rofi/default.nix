{
  username,
  config,
  pkgs,
  ...
}: let
  inherit (config) theme;
  background = theme.colour.base00;
  foreground = theme.colour.base0B;
  border = theme.colour.base02;
  # inherit (config.lib.formats.rasi) mkLiteral;
in {
  environment.systemPackages = with pkgs; [rofi];
  home-manager.users.${username} = {
    stylix.targets.rofi.enable = false;
    wayland.windowManager.hyprland.settings.bind = [
      "$mainMod, space, exec, pkill wofi || wofi --show drun --sort-order=alphabetical "
    ];

    programs.rofi = {
      enable = true;
      ## package = pkgs.rofi;
      terminal = pkgs.bash;

      location = "center";
      theme = {
        "*" = {
          background-color = "#${background}";
          foreground-color = "#${foreground}";
          border-color = "#${border}";
        };
      };
    };
  };
}
