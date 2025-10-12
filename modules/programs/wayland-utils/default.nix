{
  username,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    grim # wayland screenshot util
    sway-contrib.grimshot # grim wrapper
    wl-clipboard # clipboard
  ];

  home-manager.users.${username} = {
    wayland.windowManager.hyprland.settings.bind = [
      ", Print, exec, grimshot --notify savecopy screen"
      "CTRL, Print, exec, grimshot --notify savecopy area"
    ];

    home.shellAliases = {
      "c" = "wl-copy";
      "v" = "wl-paste";
      "p" = "wl-paste";
    };
  };
}
