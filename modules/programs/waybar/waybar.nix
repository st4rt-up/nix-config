{config, ...}: let
  inherit (config) theme username;
in {
  home-manager.users.${username} = {
    wayland.windowManager.hyprland.settings.exec-once = [
      "waybar"
    ];

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
        ];

        modules-center = [
          "hyprland/workspaces"
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
