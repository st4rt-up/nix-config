{...}: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "hypridle"
  ];

  services.hypridle = {
    enable = true;

    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 900;
          on-timeout = "hyprlock";
        }
      ];
    };
  };
}
