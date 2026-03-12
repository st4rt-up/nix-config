{
  username,
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) optionalAttrs mkOption replaceStrings concatStringsSep;
  inherit (lib.types) listOf str enum;

  link = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
  niri-config = "rofipowermenu-niri.kdl";

  mkOpt = type: default:
    mkOption {
      inherit type default;
    };
in {
  config = {
    environment.systemPackages = with pkgs; [
      rofi
      rofi-power-menu
    ];

    home-manager.users.${username} = {
      programs.rofi.enable = true;

      xdg.configFile = let
        powerMenu = config.var.rofi-power-menu;
        launchCommand =
          replaceStrings ["\t" "\r" "\n" "\""] ["" " " " " "\\\""]
          (concatStringsSep "\n" ([
              "rofi -show power-menu"
              "-modi \"power-menu:rofi-power-menu --choices=${concatStringsSep "/" powerMenu.choices}\""
            ]
            ++ powerMenu.config
            ++ powerMenu.extraConfig
            ++ powerMenu.binds));
      in
        optionalAttrs config.programs.niri.enable
        {
          "niri/config.kdl".text = "include \"${niri-config}\"";
          "niri/${niri-config}".source = link (pkgs.writeText "./${niri-config}" ''
            input {
              disable-power-key-handling
            }

            binds {
              XF86PowerOff {
                spawn-sh "
                  timeout 4s ${launchCommand};
                ";
              }
            }
          '');
        };
    };
  };

  options = {
    var.rofi-power-menu = {
      config =
        mkOpt (listOf str)
        [
          "-display-power-menu ''"
          "-click-to-exit"
          "-steal-focus"
          "-replace"
        ];
      extraConfig = mkOpt (listOf str) [];
      choices =
        mkOpt (listOf (enum ["lockscreen" "logout" "suspend" "hibernate" "reboot" "shutdown"]))
        [
          "logout"
          "suspend"
          "reboot"
          "shutdown"
        ];
      binds =
        mkOpt (listOf str)
        [
          "-kb-row-up ''"
          "-kb-row-down ''"
          "-kb-element-prev 'Up,Shift+Tab'"
          "-kb-element-next 'Down,Tab'"
          "-kb-accept-entry 'Return'"
        ];
    };
  };
}
