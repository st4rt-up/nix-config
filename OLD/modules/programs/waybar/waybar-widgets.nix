{username, ...}: {
  home-manager.users.${username} = {
    programs.waybar.settings.mainBar = {
      "hyprland/workspaces" = {
        format = "{id}";
      };

      "hyprland/window" = {
        "icon" = "true";
        "icon-size" = 24;
        format = "{}";
        max-length = 50;
        rewrite."" = ":)";
        # seperate-outputs = "true";
      };

      "clock" = {
        format = "{:%I:%M %p}";
        "tooltip-format" = "<tt><small>{calendar}</small></tt>";
        calendar = {
          "mode" = "month";
          "mode-mon-col" = 3;
          "weeks-pos" = "right";
          "on-scroll" = 1;
          "on-click-right" = "mode";

          format = {
            "months" = "<span color='#ffead3'><b>{}</b></span>";
            "days" = "<span color='#ecc6d9'><b>{}</b></span>";
            "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
            "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
            "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
          };
        };
      };

      # thanks https://github.com/HeinzDev/Hyprland-dotfiles/blob/main/home/programs/waybar/default.nix
      "network" = {
        "format-disconnected" = "󰯡 Disconnected";
        "format-ethernet" = "󰒢 Connected!";
        "format-linked" = "󰖪 {essid} (No IP)";
        "format-wifi" = "󰖩 {essid}";
        "interval" = 1;
        "tooltip" = false;
        "max-length" = 25;
      };
      "battery" = {
        "states" = {
          "good" = 95;
          "warning" = 30;
          "critical" = 20;
        };
        "interval" = 10;
        "format" = "{icon} {capacity}%";
        "format-charging" = " {capacity}%";
        "format-plugged" = " {capacity}%";
        "format-alt" = "{time} {icon}";
        "format-icons" = [
          "󰂎"
          "󰁺"
          "󰁻"
          "󰁼"
          "󰁽"
          "󰁾"
          "󰁿"
          "󰂀"
          "󰂁"
          "󰂂"
          "󰁹"
        ];
      };
      "wireplumber" = {
        "format" = "{icon} {volume}%";
        "format-muted" = "{icon} x %";
        "format-icons" = {
          "mute" = "";
          "default" = ["󰕿" "󰖀" "󰕾"];
        };

        "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      };
    };
  };
}
