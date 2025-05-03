{
  config,
  theme,
  ...
}: {
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
      position = theme.bar.position;
      height = theme.bar.height;
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
}
