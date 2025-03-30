{pkgs, ...}: {
  programs.zoxide = {
    enable = true;

    enableBashIntegration = true;
    # enableZshIntegration = true;

    options = [
      "--cmd cd"
    ];
  };

  home.packages = with pkgs; [
    zoxide
  ];
}
