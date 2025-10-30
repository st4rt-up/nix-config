{
  username,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    swayosd
  ];

  home-manager.users.${username} = {
    wayland.windowManager.hyprland.settings = {
      exec-once = ["swayosd-server"];
    };

    services.swayosd.enable = true;

    wayland.windowManager.hyprland.settings.binde = [
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
}
