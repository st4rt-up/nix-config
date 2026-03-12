{
  username,
  config,
  pkgs,
  ...
}: let
  idle-screen-dim = 3 * 60;
  idle-screen-off = 10 * 60; # completely turn off screen
  idle-sleep = idle-screen-off + 30; # suspend
  warning = 30; # notifcation before screen turns off

  display-on = "${config.programs.niri.package}/bin/niri msg action power-on-monitors";
  display-off = "${config.programs.niri.package}/bin/niri msg action power-off-monitors";

  display-dim-min = "${pkgs.brightnessctl}/bin/brightnessctl s 2%";
  display-dim = "${pkgs.brightnessctl}/bin/brightnessctl -s s 5%";
  display-dim-restore = "${pkgs.brightnessctl}/bin/brightnessctl -r";

  kb-backlight-off = "${pkgs.brightnessctl}/bin/brightnessctl -d asus::kbd_backlight -s s 0%";
  kb-backlight-restore = "${pkgs.brightnessctl}/bin/brightnessctl -d asus::kbd_backlight -r";

  suspend = "${pkgs.systemd}/bin/systemctl suspend";
in {
  assertions = [
    {
      assertion = idle-screen-dim < idle-screen-off;
      message = ''
        swayidle/default.nix: (invalid parameters)
        idle-screen-off is higher than idle-screen-dim
      '';
    }
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

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];

  home-manager.users.${username} = {
    services.swayidle = {
      enable = true;

      timeouts = [
        {
          timeout = idle-screen-off - warning;
          command = "${pkgs.libnotify}/bin/notify-send 'Computer inactive' 'Screen turning off in ${toString warning} seconds' -t 5000";
        }

        {
          timeout = idle-screen-dim;
          command = display-dim;
          resumeCommand = display-dim-restore;
        }
        {
          timeout = idle-screen-off;
          command = display-dim-min;
          resumeCommand = display-dim-restore;
        }
        {
          timeout = idle-screen-dim;
          command = kb-backlight-off;
          resumeCommand = kb-backlight-restore;
        }
        {
          timeout = idle-sleep; # little bit of grace period after the monitors turn off
          command = suspend;
        }
      ];

      events = {
        before-sleep = display-off;
        after-resume = display-on;
        unlock = display-on;
      };
    };
  };
}
