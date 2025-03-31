{
  var,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [hyprpaper];
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
}
