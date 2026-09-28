{inputs, ...}: {
  modules.stasis.nixos = {pkgs, ...}: let
    target = "graphical-session.target";
    pathPackages = with pkgs; [
      systemd
      coreutils
      bashInteractive
      pulseaudio
      libnotify
      brightnessctl
      niri
    ];
  in {
    security.pam.services.swaylock = {};

    environment.systemPackages = with pkgs; [
      stasis
    ];

    systemd.user.services.stasis-daemon = {
      enable = true;
      name = "stasis-daemon";
      description = "Stasis Wayland Idle Manager";
      partOf = [target];
      after = [target];
      wantedBy = [target];

      path = pathPackages;

      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.stasis}/bin/stasis";
        ExecReload = "${pkgs.stasis}/bin/stasis reload";
        Restart = "on-failure";
        RestartSec = "2";

        PassEnvironment = [
          "NIRI_SOCKET"
          "WAYLAND_DISPLAY"
          "XDG_RUNTIME_DIR"
          "DBUS_SESSION_BUS_ADDRESS"
        ];
      };
    };

    /*
    systemd.user.services.stasis-tray = {
      enable = true;
      name = "stasis-tray";
      after = [target "stasis-daemon.service"];
      partOf = [target];
      wantedBy = [target];

      path = pathPackages;

      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.stasis}/bin/stasis tray";
        Restart = "on-failure";

        PassEnvironment = [
          "WAYLAND_DISPLAY"
          "XDG_RUNTIME_DIR"
          "DBUS_SESSION_BUS_ADDRESS"
        ];
      };
    };
    */
  };
}
