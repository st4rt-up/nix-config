{
  config,
  lib,
  hostname,
  ...
}: let
  username = "kai";
in {
  # set variables declared in /modules/core/config-host
  config.var = {
    inherit username hostname;

    terminal = "kitty";
    gui = true;

    wallpaper = "./..//wallpaper/cherry-blossom.jpg";
  };

  imports = [
    # {_module.args = {inherit inputs;};}

    # system level imports
    ./../../modules/system/fonts.nix

    ./../../modules/system/systemd-boot.nix
    ./../../modules/system/pipewire.nix
    ./../../modules/system/bluetooth.nix
    ./../../modules/system/fingerprint.nix

    ./../../modules/home
    ./hardware-configuration.nix

    # ./../../modules/system/greetd.nix
    ./../../modules/system/wayland.nix
    ./../../modules/system/gnome.nix
  ];

  config.system.stateVersion = "24.11";
}
