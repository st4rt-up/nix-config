{pkgs, ...}: {
  programs.zoxide = {
    enable = true;

    enableBashIntegration = true;
    # enableZshIntegration = true;

    options = [
      "--cmd cd"
    ];
  };

  programs.bash.enable = true;

  home.packages = with pkgs; [
    zoxide
  ];
}
