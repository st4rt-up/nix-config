{
  modules.papirus-icons = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        papirus-icon-theme
      ];

      qt.enable = true;
    }; #//nixos

    home.gtk = {
      enable = true;
      iconTheme.name = "Papirus-Dark";
    }; #//home
  };
}
