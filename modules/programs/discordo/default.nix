# currently requires home-manager
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    discordo
  ];
}
