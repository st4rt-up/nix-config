_: let
  core = [
    "options"
    "stylix"
  ];
  programs = [
    "gtk"
    "qt"

    "mako"
    "rofi"
    "rofi-power-menu"
    "kitty"
    "niri"
  ];
in {
  imports =
    (map (p: ./modules/${p}) programs)
    ++ (map (p: ./core/${p}.nix) core);
}
