{username, ...}: {
  imports = [
    ../../modules/home-manager/programs/neovim

    ../../modules/home-manager/programs/git.nix
    ../../modules/home-manager/programs/kitty.nix

    ../../modules/home-manager/programs/nixcord.nix
    ../../modules/home-manager/programs/obsidian.nix

    ../../modules/home-manager/programs/tmux.nix
    ../../modules/home-manager/programs/vscode.nix
    ../../modules/home-manager/programs/zen.nix
    ../../modules/home-manager/programs/zoxide.nix

    ../../modules/home-manager/system/hypr

    ../../modules/home-manager/system/mako.nix
    ../../modules/home-manager/system/rofi.nix
  ];

  home = {
    inherit username;

    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
