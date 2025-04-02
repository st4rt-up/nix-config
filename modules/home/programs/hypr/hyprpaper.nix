{
  var,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [hyprpaper];

  wayland.windowManager.hyprland.settings = {
    exec-once = ["hyprpaper"];
  };

  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        "${var.wallpaper}"
      ];

      wallpaper = [
        " , ${var.wallpaper}"
      ];
    };
  };

  wayland.windowManager.hyprland.settings.misc = {
    disable_splash_rendering = "true";
    disable_hyprland_logo = "true";
  };
}
