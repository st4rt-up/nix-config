{
  config,
  username,
  pkgs,
  ...
}: let
  wallpaper = config.home-manager.users.${username}.home.homeDirectory + "/wallpaper/cherry-blossom.jpg";
in {
  home-manager.users.${username} = {
    home.packages = with pkgs; [hyprpaper];

    wayland.windowManager.hyprland.settings = {
      exec-once = ["hyprpaper"];
    };

    services.hyprpaper = {
      enable = true;

      settings = {
        preload = ["${wallpaper}"];
        wallpaper = [" , ${wallpaper}"];
      };
    };

    wayland.windowManager.hyprland.settings.misc = {
      disable_splash_rendering = "true";
      disable_hyprland_logo = "true";
    };
  };
}
