{...}: {
  programs.waybar = {
    enable = true;

    settings.mainBar = {
      layer = "top";
      position = "bottom";
      height = 35;

      modules-left = ["hyprland/workspaces"];
      # modules-center = [];
      modules-right = ["clock"];

      "hyprland/workspaces" = {
        format = "{id}";
      };

      "clock" = {
        format = "{:%I:%M %p}";
      };
    };
  };
}
