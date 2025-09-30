{pkgs, ...}: {
  home.packages = with pkgs; [
    # wf-recorder

    # screenshot utilities
    grim
    sway-contrib.grimshot

    wl-clipboard
  ];

  wayland.windowManager.hyprland.settings.bind = [
    ", Print, exec, grimshot --notify savecopy screen"
    "CTRL, Print, exec, grimshot --notify savecopy area"
  ];

  home.shellAliases = {
    "c" = "wl-copy";
    "v" = "wl-paste";
  };
}
