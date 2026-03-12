{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5ct
    kdePackages.qt6ct
    adwaita-qt
    adwaita-qt6
  ];

  qt = {
    # enable = true;
    # style = "adwaita-dark";
    platformTheme = "qt5ct";
  };
}
