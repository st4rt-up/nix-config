{pkgs, ...}: {
  home.packages = with pkgs; [
    wf-recorder
    grim
    sway-contrib.grimshot
  ];
}
