# thanks https://github.com/Frost-Phoenix/nixos-config/blob/main/modules/home/hyprland/default.nix
# for the idea
_: {
  imports = [
    ./hyprland.nix

    ./hyprland-binds.nix

    ./hyprpaper.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];
}
