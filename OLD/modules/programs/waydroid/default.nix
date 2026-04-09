{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    waydroid-helper
    waydroid-nftables
  ];
  virtualisation.waydroid = {
    enable = true;
    package = pkgs.waydroid-nftables;
  };

  systemd = {
    packages = with pkgs; [
      waydroid-helper
    ];
    services.waydroid-mount.wantedBy = ["multi-user.target"];
  };
}
