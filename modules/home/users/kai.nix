# user files are home level
{
  lib,
  var,
  ...
}: {
  imports =
    [
      # ./../../themes/kai-dark.nix
      # ./../options-home.nix

      ./../programs/neovim

      ./../programs/shell/bash.nix
      ./../programs/shell/shell-aliases.nix

      ./../programs/shell/tmux.nix
      ./../programs/shell/atuin # command history
      ./../programs/shell/zoxide.nix # cd replacment
      ./../programs/shell/eza.nix # ls replacement
      ./../programs/shell/direnv.nix

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
      ./../programs/okular.nix

      ./../programs/hypr
      ./../programs/kitty.nix
      ./../programs/mako.nix
      ./../programs/rofi.nix
      ./../programs/wofi.nix
      ./../programs/swayosd.nix
      ./../programs/wayland-utils.nix

      ./../programs/godot.nix

      ./../programs/gtk.nix
    ]
    ++ lib.optionals
    var.secrets
    [
      ./../../secrets/users/kai.nix
    ];

  home = {
    inherit (var) username;

    stateVersion = "24.11";
  };

  # nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
