{
  username,
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  link = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
  configPath = config.var.flake-path + "/modules/programs/swayosd/dotfiles";

  niri-config = "swayosd-niri.kdl";
in {
  environment.systemPackages = with pkgs; [swayosd];

  home-manager.users.${username} = {
    services.swayosd.enable = true;

    xdg.configFile =
      # ==== niri binds
      mkIf config.programs.niri.enable
      {
        "niri/config.kdl".text = "include \"${niri-config}\"";
        "niri/${niri-config}".source = link configPath + "/${niri-config}";
      };

    # ==== hyprland binds
    wayland.windowManager.hyprland.settings =
      mkIf config.programs.hyprland.enable
      {
        exec-once = ["swayosd-server"];
        binde = [
          ", $raiseVolume, exec, swayosd-client --output-volume raise"
          ", $lowerVolume, exec, swayosd-client --output-volume lower"

          "SHIFT, $raiseVolume, exec, swayosd-client --output-volume +10"
          "SHIFT, $lowerVolume, exec, swayosd-client --output-volume -10"

          "CTRL, $raiseVolume, exec, swayosd-client --output-volume +1"
          "CTRL, $lowerVolume, exec, swayosd-client --output-volume -1"

          ", $muteVolume, exec, swayosd-client --output-volume mute-toggle"

          ", $raiseBrightness, exec, swayosd-client --brightness raise"
          ", $lowerBrightness, exec, swayosd-client --brightness lower"
        ];
      };
  };
}
