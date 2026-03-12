{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gparted # partition manager
    ncdu # disk usage
    ntfsprogs
  ];
}
