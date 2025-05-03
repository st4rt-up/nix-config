# user files are home level
{
  lib,
  var,
  inputs,
  ...
}: {
  imports =
    [
      # ./../../themes/kai-dark.nix
      # ./../options-home.nix

      ./../programs/neovim

      ./../programs/shell/tmux.nix
      ./../programs/shell/zoxide.nix

      ./../programs/git.nix
    ]
    ++ lib.optionals
    var.gui
    [
      ./../programs/nixcord.nix
      ./../programs/obsidian.nix
      ./../programs/vscode.nix
      ./../programs/signal.nix

      ./../programs/zen-browser.nix

      ./../programs/hypr
      ./../programs/kitty.nix
      ./../programs/mako.nix
      ./../programs/rofi.nix
      ./../programs/wofi.nix
      ./../programs/swayosd.nix
      ./../programs/wayland-utils.nix

      ./../programs/godot.nix

      ./../programs/gtk.nix
    ];

  home = {
    username = var.username;

    stateVersion = "24.11";
  };

  # nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
