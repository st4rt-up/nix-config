{
  username,
  config,
  pkgs,
  ...
}: let
  # screen-dim
  idle-screen-off = 5 * 60;
  idle-sleep = 5 * 60 + 30;
  warning = 15;

  display-on = "${config.programs.niri.package}/bin/niri msg action power-on-monitors";
  display-off = "${config.programs.niri.package}/bin/niri msg action power-off-monitors";

  suspend = "${pkgs.systemd}/bin/systemctl suspend";
in {
  assertions = [
    {
      assertion = idle-screen-off < idle-sleep;
      message = ''
        swayidle/default.nix: (invalid parameters)
        idle-screen-off is higher than idle-sleep / the device would lock before the monitors turn off
        fix: set idle-screen-off to be lower than idle-sleep
      '';
    }
    {
      assertion = warning < idle-screen-off;
      message = ''
        swayidle/default.nix: (invalid parameters)
        warning is higher than idle-screen-off / the warning notification has a negative timeout value
        fix: set warning to be lower than idle-screen-off
      '';
    }
  ];
  home-manager.users.${username} = {
    services.swayidle = {
      enable = true;

      timeouts = [
        {
          timeout = idle-screen-off - warning;
          command = "${pkgs.libnotify}/bin/notify-send 'Screen turning off in ${toString warning} seconds' -t 5000";
        }
        {
          timeout = idle-screen-off;
          command = display-off;
          resumeCommand = display-on;
        }
        {
          timeout = idle-sleep; # little bit of grace period after the monitors turn off
          command = suspend;
        }
      ];

      events = [
        {
          event = "before-sleep";
          command = display-off;
        }
        {
          event = "after-resume";
          command = display-on;
        }
        {
          event = "unlock";
          command = display-on;
        }
      ];
    };
  };
}
