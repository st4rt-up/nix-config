{
  username,
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (builtins) concatStringsSep;
  inherit (lib) mergeAttrsList;

  link = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
  configPath = config.var.flake-path + "/modules/programs/tmux/dotfiles";
  symlinkPath = "~/.config/tmux";
  rootConfig = "config.common";

  configFiles = [
    "tmux"
  ];

in {
  environment.systemPackages = with pkgs; [tmux];

  programs.tmux = {
    enable = true;
    # clock24 = true;

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      sensible
    ];

    extraConfig = ''
      set -g base-index 1
      set -g pane-base-index 1

      bind r source-file ${symlinkPath}/${rootConfig}
      source-file ${symlinkPath}/${rootConfig}
    '';
  };

  home-manager.users.${username} = {
    xdg.configFile =
      mergeAttrsList (map (file: {"tmux/${file}.common".source = link configPath + "/${file}.common";}) configFiles)
      // {
      "tmux/${rootConfig}".text = concatStringsSep "\n" (
        map (file: "source-file ${symlinkPath}/${file}.common")
        configFiles
      );
    };
  };
}
