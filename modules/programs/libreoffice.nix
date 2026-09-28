{
  modules.libreoffice.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      libreoffice-qt
      hunspell
    ];
  };
}
