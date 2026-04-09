{
  username,
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf mkOption;
  inherit (config) theme;
  inherit (lib.types) bool enum ints int str package;

  mkOpt = type: default:
    mkOption {
      inherit type default;
    };
in {
  options.theme = {
    rofi-power-menu = {
      enable = mkOpt bool false;

      font = {
        name = mkOpt str theme.launcher.font.name;
        package = mkOpt package theme.launcher.font.package;
        size = mkOpt int theme.launcher.font.size;
      };

      location = mkOpt (enum ["north" "northeast" "northwest" "south" "southeast" "southwest" "east" "west" "center"]) "southeast";
      anchor = mkOpt (enum ["north" "northeast" "northwest" "south" "southeast" "southwest" "east" "west" "center"]) "southeast";

      width = mkOpt (ints.between 1 100) 14;
      height = mkOpt (ints.between 1 100) 23;

      offset.horizontal = mkOpt int 0;
      offset.vertical = mkOpt int 0;
    };
  };

  config = mkIf config.theme.rofi-power-menu.enable {
    var.rofi-power-menu.extraConfig = [
      "-theme \"~/.config/rofi/powermenu/generated-theme.rasi\""
    ];
    home-manager.users.${username} = {
      xdg.configFile = {
        "rofi/powermenu/generated-theme.rasi".text = ''
          // GENERATED THEME FOR ROFI POWER MENU
          * {
            primary: #${theme.colour.primary}FF;
            foreground: #${theme.colour.foreground}FF;
            background: #${theme.colour.background-alt}FF;
            lightfg: #${theme.colour.foreground}FF;
            lightbg: #${theme.colour.background-alt}FF;
            font: "${theme.rofi-power-menu.font.name} ${toString theme.rofi-power-menu.font.size}";

            background-color: var(background);
            normal-foreground:           var(foreground);
            normal-background:           var(background);
            selected-normal-foreground:  var(lightbg);
            selected-normal-background:  var(lightfg);
            alternate-normal-foreground: var(foreground);
            alternate-normal-background: var(lightbg);

            active-foreground:           var(foreground);
            active-background:           var(background);
            alternate-active-foreground: var(lightfg);
            alternate-active-background: var(lightbg);
            selected-active-background:  var(foreground);
            selected-active-foreground:  var(background);

            urgent-foreground:           var(primary);
            urgent-background:           var(background);
            alternate-urgent-foreground: var(primary);
            alternate-urgent-background: var(lightbg);
            selected-urgent-foreground:  var(background);
            selected-urgent-background:  var(primary);
            text-color: var(foreground);
          }

          window {
            location: ${theme.rofi-power-menu.location};
            anchor: ${theme.rofi-power-menu.anchor};
            height: ${toString theme.rofi-power-menu.height}%;
            width: ${toString theme.rofi-power-menu.width}%;
            margin: 0.5%;
            padding: 0.5%;
            border-color: #${theme.colour.background};
            border: ${toString theme.widgets.border.size}px;
            x-offset: ${toString theme.rofi-power-menu.offset.horizontal}%;
            y-offset: ${toString theme.rofi-power-menu.offset.vertical}%;
          }

          element normal.normal {
              background-color: var(normal-background);
              text-color:       var(normal-foreground);
          }
          element normal.urgent {
              background-color: var(urgent-background);
              text-color:       var(urgent-foreground);
          }
          element normal.active {
              background-color: var(active-background);
              text-color:       var(active-foreground);
          }
          element selected.normal {
              background-color: var(selected-normal-background);
              text-color:       var(selected-normal-foreground);
          }
          element selected.urgent {
              background-color: var(selected-urgent-background);
              text-color:       var(selected-urgent-foreground);
          }
          element selected.active {
              background-color: var(selected-active-background);
              text-color:       var(selected-active-foreground);
          }
          element alternate.normal {
              background-color: var(alternate-normal-background);
              text-color:       var(alternate-normal-foreground);
          }
          element alternate.urgent {
              background-color: var(alternate-urgent-background);
              text-color:       var(alternate-urgent-foreground);
          }
          element alternate.active {
              background-color: var(alternate-active-background);
              text-color:       var(alternate-active-foreground);
          }

          inputbar {
            padding: 6px;
            spacing: 3px;
          }

          num-rows {
            expand: true;
          }

          overlay {
              padding:          0px 0.2000em ;
              background-color: var(normal-foreground);
              foreground-color: var(normal-background);
              margin:           0px 0.2000em ;
              text-color:       var(normal-background);
          }

          entry {
            placeholder: "";
            cursor-width: 2px;
            hide-cursor-on-empty: true;
          }

          element-text {
            padding: 2px;
          }
        '';
      };
    };
  };
}
