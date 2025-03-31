# thanks https://github.com/Frost-Phoenix/nixos-config/blob/main/modules/home/hyprland/default.nix
# for the idea
{...}: {
  imports = [
    ./hyprland.nix

    ./hyprland-config.nix
    ./hyprland-binds.nix

    ./waybar.nix

    ./hyprpaper.nix
    ./hypridle.nix
    ./hyprlock.nix
    # ./cursor.nix
  ];
}
