{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    wayland
    hyprpolkitagent

    # these were copy pasted from https://github.com/Frost-Phoenix/nixos-config/blob/main/modules/home/hyprland/hyprland.nix
    # might be worth looking into

    # inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    # inputs.hyprmag.packages.${pkgs.system}.hyprmag
    # hyprpicker

    # grim
    # slurp
    # wl-clip-persist
    # cliphist
    # wf-recorder
    # glib<Down>

    # direnv
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];

  services.hyprpolkitagent = {
    enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;

    xwayland = {
      enable = true;
    };

    systemd = {
      enable = true;
      variables = ["-all"];
    };
  };
}
