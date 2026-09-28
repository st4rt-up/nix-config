{inputs, ...}: {
  modules.quickshell.nixos = {pkgs, ...}: {
    environment.systemPackages =
      [
        # inputs.quickshell.packages."${pkgs.stdenv.hostPlatform.system}".default
        inputs.qml-niri.packages."${pkgs.stdenv.hostPlatform.system}".quickshell
      ]
      ++ (with pkgs; [
        brightnessctl
        libnotify
      ]);

    services.upower.enable = true;
    /*
    programs.quickshell = {
      enable = true;
    };
    */
  };
}
