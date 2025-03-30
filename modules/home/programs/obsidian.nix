{pkgs, ...}: {
  home.packages = with pkgs; [
    obsidian
    rofi-obsidian
  ];
}
