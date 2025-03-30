{
  var,
  inputs,
  ...
}: {
  imports = [
    {_module.args = {inherit inputs;};}
    ./../../themes/kai-dark.nix

    ./../programs/hypr
    ./../programs/mako.nix
    ./../programs/rofi.nix

    ./../programs/neovim

    ./../programs/shell/tmux.nix
    ./../programs/shell/zoxide.nix

    ./../programs/kitty.nix
    ./../programs/git.nix

    ./../programs/nixcord.nix
    ./../programs/obsidian.nix
    ./../programs/vscode.nix

    ./../programs/zen-browser.nix
  ];

  home = {
    username = var.username;

    stateVersion = "24.11";
  };

  # nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
