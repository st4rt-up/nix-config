{
  username,
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (builtins) listToAttrs concatStringsSep;
  inherit (lib) optionalAttrs;
  # inherit (config.home-manager.users.${username}.lib.formats.rasi) mkLiteral;

  outOfStore = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
  configPath = config.var.flake-path + "/modules/programs/rofi/dotfiles";
  # home = config.home-manager.users.${username};

  configFiles = [
    "configuration"
    "binds"
  ];

  niri-config = "rofi-niri.kdl";
in {
  environment.systemPackages = with pkgs; [rofi];
  home-manager.users.${username} = {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi;
    };

    # similar pattern to my niri config, more notes there
    xdg.configFile =
      listToAttrs (map (file: {
          name = "rofi/${file}.rasi";
          value.source = outOfStore configPath + "/${file}.rasi";
        })
        configFiles)
      // {
        "rofi/config.rasi".text = concatStringsSep "\n" (map (file: "@import \"${file}\"") configFiles);
      }
      // optionalAttrs config.programs.niri.enable
      {
        "niri/config.kdl".text = "include \"${niri-config}\"";
        "niri/${niri-config}".source = outOfStore configPath + "/${niri-config}";
      };

    # stylix.targets.rofi.enable = false;
  };
}
