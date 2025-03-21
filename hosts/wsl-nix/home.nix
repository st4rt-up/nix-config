{username, ...}: {
  imports = [
    ../../modules/home-manager/programs/neovim

    ../../modules/home-manager/programs/git.nix
    ../../modules/home-manager/programs/tmux.nix
    ../../modules/home-manager/programs/zoxide.nix
  ];

  home = {
    inherit username;

    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
