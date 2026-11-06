{
  modules.distrobox.nixos = {pkgs, ...}: {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };

    environment.systemPackages = [pkgs.distrobox];
  };
}
