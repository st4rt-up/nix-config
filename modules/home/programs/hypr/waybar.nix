{config, ...}: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "waybar"
  ];

  imports = [
    ./waybar-widgets.nix
    ./waybar-style.nix
  ];

  programs.waybar = {
    enable = true;

    settings.mainBar = {
      layer = "top";
      position = config.theme.bar.position;
      height = config.theme.bar.height;
      margin-left = config.theme.gaps-out;
      margin-right = config.theme.gaps-out;
      spacing = config.theme.gaps-in;
      modules-left = [
        "hyprland/window"
      ];

      modules-center = [
        "hyprland/workspaces"
      ];

      modules-right = [
        # "volume"
        "network"
        "battery"
        "clock"
      ];
    };
  };
}
