{lib, ...}: let
  inherit (builtins) elem;
  inherit (lib) getName;
in {
  modules.bluetooth.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      blueman
    ];

    nixpkgs.config.allowUnfreePredicate = pkg:
      elem (getName pkg) [
        "broadcom-bt-firmware"
        "b43-firmware"
        "xone-dongle-firmware"
        "facetimehd-calibration"
        "facetimehd-firmware"
      ];

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    services.blueman.enable = true;
  };
}
