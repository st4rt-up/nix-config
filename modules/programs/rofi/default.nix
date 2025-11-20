{
  username,
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (builtins) concatStringsSep;
  inherit (lib) mergeAttrsList optionalAttrs;

  link = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
  configPath = config.var.flake-path + "/modules/programs/rofi/dotfiles";

  configFiles = [
    "configuration"
    "binds"
  ];

  niri-config = "rofi-niri.kdl";
in {
  environment.systemPackages = with pkgs; [rofi];
  home-manager.users.${username} = {
    stylix.targets.rofi.enable = false;
    programs.rofi = {
      enable = true;
      package = pkgs.rofi;
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
