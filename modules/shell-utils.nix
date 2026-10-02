{
  modules.shell-utils.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      git # version control
      ripgrep # rust grep
      fzf # fuzzy find
      zoxide # better cd
      # yazi # tui file manager
      tmux # terminal multiplexer
      btop # task manager
      fastfetch
    ];
  };

  modules.zoxide.home = {
    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;

      options = ["--cmd cd"];
    };

    programs.bash.enable = true;
  };
}
