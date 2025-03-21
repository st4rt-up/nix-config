# thanks https://github.com/Frost-Phoenix/nixos-config/blob/main/modules/home/hyprland/default.nix
# for the idea
{...}: {
  imports = [
    ./hyprland.nix

    ./config.nix
    ./binds.nix

    ./waybar.nix

    # ./hyprpaper.nix
    # ./hyprlock.nix
    # ./cursor.nix
  ];
}
