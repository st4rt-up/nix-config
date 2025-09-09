{pkgs, ...}: {
  home.packages = with pkgs; [
    wf-recorder

    # screenshot utilities
    grim
    sway-contrib.grimshot
  ];

  wayland.windowManager.hyprland.settings.bind = [
    ", Print, exec, grimshot --notify savecopy screen"
    "Control_L , Print, exec, grimshot --notify savecopy area"

  ];
}
