{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    themix-gui
  ];
}
