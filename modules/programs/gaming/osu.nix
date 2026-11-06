{
  modules.osu-lazer.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      osu-lazer-bin
    ];
  };
}
