{
  config,
  lib,
  ...
}: let
  # inherit (builtins) concatStringsSep;
  inherit
    (lib)
    # mergeAttrsList
    mkForce
    ;
in {
  modules.niri = {
    nixos = {pkgs, ...}: {
      systemd.user.services.stasis-daemon.path = [
        pkgs.niri
      ];

      imports = with config.modules; [
        # stasis.nixos
        wayland.nixos
        clipboard-wayland.nixos
        nautilus.nixos
      ];

      programs.niri.enable = true;
      services.gnome.gnome-keyring.enable = mkForce false;
      environment.systemPackages = with pkgs; [
        wmctrl
        xwayland-satellite
        nirimod # gui settings screen
        grim # screenshots
        brightnessctl
        libnotify

        fuzzel # application launcher, replace
        alacritty # terminal, replace
      ];
    };
  };
}
