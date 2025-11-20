{
  username,
  config,
  pkgs,
  ...
}: let
  inherit (builtins) listToAttrs concatStringsSep;

  configPath = config.var.flake-path + "/modules/programs/tmux/dotfiles";
  symlinkPath = "~/.config/tmux";
  rootConfig = "config.common";
  outOfStore = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;

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
      listToAttrs (map (file: {
          name = "tmux/${file}.common";
          value.source = outOfStore configPath + "/${file}.common";
        })
        configFiles)
      // {
        "tmux/${rootConfig}".text = concatStringsSep "\n" (
          map (file: "source-file ~/.config/tmux/${file}.common")
          configFiles
        );
      };
  };
}
