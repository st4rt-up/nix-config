{
  modules.adb = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        scrcpy
        android-tools
      ];
    };

    user.extraGroups = [
      "adbusers"
    ];
  };
}
