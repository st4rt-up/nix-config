{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ncspot # spotify
  ];
}
