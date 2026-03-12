{
  username,
  config,
  pkgs,
  lib,
  ...
}: let
<<<<<<< HEAD
  inherit (config) theme;
  background = theme.colour.base00;
  foreground = theme.colour.base0B;
  border = theme.colour.base02;
  # inherit (config.lib.formats.rasi) mkLiteral;
in {
  environment.systemPackages = with pkgs; [rofi];
  home-manager.users.${username} = {
    stylix.targets.rofi.enable = false;
    wayland.windowManager.hyprland.settings.bind = [
      "$mainMod, space, exec, pkill wofi || wofi --show drun --sort-order=alphabetical "
    ];

    programs.rofi = {
      enable = true;
      ## package = pkgs.rofi;
      terminal = pkgs.bash;

      location = "center";
      theme = {
        "*" = {
          background-color = "#${background}";
          foreground-color = "#${foreground}";
          border-color = "#${border}";
        };
      };
=======
  inherit (builtins) concatStringsSep;
  inherit (lib) mergeAttrsList optionalAttrs;

  link = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
  configPath = config.var.path.flake + "/modules/programs/rofi/dotfiles";

  configFiles = [
    "configuration"
    "binds"
    "laptop"
  ];

  niri-config = "rofi-niri.kdl";
in {
  environment.systemPackages = with pkgs; [
    rofi
  ];
  home-manager.users.${username} = {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi;
>>>>>>> niri-and-dotfiles-rework
    };

    # similar pattern to my niri config, more notes there
    xdg.configFile =
      mergeAttrsList (map (file: {"rofi/${file}.rasi".source = link configPath + "/${file}.rasi";}) configFiles)
      // {
        "rofi/config.rasi".text = concatStringsSep "\n" (map (file: "@import \"${file}\"") configFiles);
      }
      // optionalAttrs config.programs.niri.enable
      {
        "niri/config.kdl".text = "include \"${niri-config}\"";
        "niri/${niri-config}".source = link configPath + "/${niri-config}";
      };
  };
}
