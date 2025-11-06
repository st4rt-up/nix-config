{
  username,
  config,
  lib,
  ...
}: let
  # inherit (builtins) listToAttrs concatStringsSep;
  inherit (lib) mkIf;
  inherit (config) theme;
  outOfStore = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
  configPath = config.var.flake-path + "/modules/programs/waybar/dotfiles";
  # configFiles = [];

  niri-config = "wayland-niri.kdl";
in {
  home-manager.users.${username} = {
    wayland.windowManager.hyprland.settings.exec-once = ["waybar"];

    xdg.configFile =
      {
        # "waybar/config.jsonc".source = concatStringsSep "\n" (map (file: "@import \"${file}\"") configFiles);
      }
      // mkIf config.programs.niri.enable
      {
        "niri/config.kdl".text = "include \"${niri-config}\"";
        "niri/${niri-config}".source = outOfStore configPath + "/${niri-config}";
      };

    programs.waybar = {
      enable = true;

      settings.mainBar = {
        layer = "top";
        inherit (theme.bar) position height;
        # margin-left = theme.gaps-out;
        # margin-right = theme.gaps-out;
        spacing = theme.gaps-in;

        modules-left = [
          "hyprland/window"
          "niri/window"
        ];

        modules-center = [
          "hyprland/workspaces"
          "niri/workspaces"
        ];

        modules-right = [
          "network"
          "wireplumber"
          "battery"
          "clock"
        ];
      };
    };
  };
}
