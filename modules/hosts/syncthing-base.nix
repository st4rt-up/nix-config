{lib, ...}: let
  inherit (lib) mkDefault;
in {
  modules.syncthing-base.nixos = {pkgs, ...}: {
    environment.systemPackages = [pkgs.syncthing];
    systemd.services.syncthing-init = {
      wantedBy = lib.mkForce ["graphical.target"];
      after = ["graphical.target"];
    };
    services.syncthing = {
      enable = true;
      overrideDevices = mkDefault true;
      overrideFolders = mkDefault true;
    };
  };
}
