{
  modules.misc-files.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      kdePackages.okular
      vlc
      mpv
    ];
  };
}
