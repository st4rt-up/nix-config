{
  modules.nautilus.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      libheif
      libheif.out
      nautilus
    ];
    environment.pathsToLink = ["share/thumbnailers"];

    services.gvfs.enable = true;
    services.udisks2.enable = true;
  };
}
