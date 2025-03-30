{...}: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "waybar"
  ];

  programs.waybar = {
    enable = true;

    settings.mainBar = {
      layer = "top";
      position = "bottom";
      height = 40;

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

      "hyprland/workspaces" = {
        format = "{id}";
      };

      "hyprland/window" = {
        icon = "true";
        icon-size = 24;
        format = "{}";
        max-length = 50;
        rewrite."" = ":)";
        # seperate-outputs = "true";
      };

      "clock" = {
        format = "{:%I:%M %p}";
      };

      # "network" = {};
    };
  };
}
