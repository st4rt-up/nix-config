{pkgs, ...}: {
  home.packages = with pkgs; [
    # wf-recorder

    # screenshot utilities
    grim
    sway-contrib.grimshot
  ];

  wayland.windowManager.hyprland.settings.bind = [
    ", Print, exec, grimshot --notify savecopy screen"
    "CTRL, Print, exec, grimshot --notify savecopy area"
  ];
}
