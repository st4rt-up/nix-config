{
  config,
  inputs,
  hostname,
  ...
}: {
  # set variables declared in /modules/core/config-host
  config.var = {
    username = "kai";
    inherit hostname;
  };

  imports = [
    # {_module.args = {inherit inputs;};}

    # system level imports
    ./../../modules/system/fonts.nix

    ./../../modules/system/systemd-boot.nix
    ./../../modules/system/pipewire.nix
    ./../../modules/system/bluetooth.nix

    ./../../modules/system/gnome.nix
    ./../../modules/system/wayland.nix

    ./../../modules/home
    ./hardware-configuration.nix
  ];

  config.system.stateVersion = "24.11";
}
