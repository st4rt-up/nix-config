{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    obsidian
    rofi-obsidian
  ];
}
