{
  modules.rofi = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        rofi
      ];
    };
  };
}
