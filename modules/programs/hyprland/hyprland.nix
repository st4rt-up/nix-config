{
  config,
  username,
  inputs,
  pkgs,
  ...
}: let
  inherit (config) var theme;
  hyprlandPackage = inputs.hyprland.packages.${pkgs.system}.hyprland;
  hyprlandPortalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
in {
  environment.systemPackages = with pkgs;
    [
      wayland
      hyprpolkitagent
    ]
    ++ [
      inputs.rose-pine-hyprcursor.packages.${system}.default
    ];

  programs.hyprland.enable = true;

  home-manager.users.${username} = {
    systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];
    services.hyprpolkitagent.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      package = hyprlandPackage;
      portalPackage = hyprlandPortalPackage;

      systemd = {
        enable = true;
        variables = ["-all"];
      };

      extraConfig = ''
        xwayland {
          use_nearest_neighbor = true
        }
      '';

      settings = {
        "$terminal" = "kitty";
        "$hyprcursor_theme" = "${theme.cursor.hyprcursor.name}";

        # autostart
        exec-once = [
          "hyprctl setcursor $hyprcursor_theme ${toString theme.cursor-size}"
          "$terminal"
        ];

        env = [
          "ELECTRON_OZONE_PLATFORM_HINT, wayland"
          "NIXOS_OZONE_WL, 1" # for ozone-based and electron apps to run on wayland
          "MOZ_ENABLE_WAYLAND, 1" # for firefox to run on wayland
          "MOZ_WEBRENDER, 1" # for firefox to run on wayland
          "HYPRCURSOR_THEME, $hyprcursor_theme"
          "HYPRCURSOR_SIZE, ${toString theme.cursor-size}"
          "XCURSOR_THEME, ${toString theme.cursor.xcursor.name}"
          "XCURSOR_SIZE, ${toString theme.cursor-size}"
          "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
          "QT_CURSOR_SIZE, ${toString theme.cursor-size}"
          # "GDK_SCALE, 2"
        ];

        input = {
          touchpad.natural_scroll = true;

          kb_layout = "us";
          kb_variant = "";
          kb_options = "ctrl:nocaps";
          kb_model = "";
          kb_rules = "";

          # sensitivity = "-0.5";
          accel_profile = "flat";
        };

        monitor = ",preferred,auto,${toString theme.monitor-scaling}";

        general = {
          gaps_in = theme.gaps-in;
          gaps_out = theme.gaps-out;
        };

        decoration = {
          rounding = theme.rounding;
          active_opacity = theme.active-opacity;
          inactive_opacity = theme.inactive-opacity;

          blur = {
            enabled = theme.blur;
          };

          shadow = {
            enabled = false; # TODO add this to options-theme
          };
        };

        misc = {
          vfr = true;
        };

        animations = {
          enabled = false;
          bezier = [
            "easeOutQuint,0.23,1,0.32,1"
            "easeInOutCubic,0.65,0.05,0.36,1"
            "linear,0,0,1,1"
            "almostLinear,0.5,0.5,0.75,1.0"
            "quick,0.15,0,0.1,1"
          ];

          animation = [
            "global, 1, 10, default"
            "border, 1, 5.39, easeOutQuint"
            "windows, 1, 4.79, easeOutQuint"
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
            "windowsOut, 1, 1.49, linear, popin 87%"
            "fadeIn, 1, 1.73, almostLinear"
            "fadeOut, 1, 1.46, almostLinear"
            "fade, 1, 3.03, quick"
            "layers, 1, 3.81, easeOutQuint"
            "layersIn, 1, 4, easeOutQuint, fade"
            "layersOut, 1, 1.5, linear, fade"
            "fadeLayersIn, 1, 1.79, almostLinear"
            "fadeLayersOut, 1, 1.39, almostLinear"
            "workspaces, 1, 1.94, almostLinear, fade"
            "workspacesIn, 1, 1.21, almostLinear, fade"
            "workspacesOut, 1, 1.94, almostLinear, fade"
          ];
        };

        # keybind aliases
        "$mainMod" = "SUPER";
        "$raiseBrightness" = "XF86MonBrightnessUp";
        "$lowerBrightness" = "XF86MonBrightnessDown";
        "$raiseVolume" = "XF86AudioRaiseVolume";
        "$lowerVolume" = "XF86AudioLowerVolume";
        "$muteVolume" = "XF86AudioMute";
      };
    };
  };
}
