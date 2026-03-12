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
  configPath = config.var.path.flake + "/modules/programs/tmux/dotfiles";
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
      resurrect
      continuum
    ];

    extraConfig = ''
      source-file ${symlinkPath}/${rootConfig}
    '';
  };

  home-manager.users.${username} = {
    xdg.configFile =
      mergeAttrsList (map (file: {"tmux/${file}.common".source = link configPath + "/${file}.common";}) configFiles)
      // {
        "tmux/${rootConfig}".text = concatStringsSep "\n" (
          map (file: "source-file ${symlinkPath}/${file}.common")
          (configFiles
            ++ [
              "plugins"
              "reload"
            ])
        );
        "tmux/plugins.common".text = ''
          # GENERATED FILE, DO NOT EDIT
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          # set -g @resurrect-capture-pane-contents 'on'

          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '10';
          set -g @continuum-restore 'on'
        '';
        "tmux/reload.common".text = ''
          # GENERATED FILE, DO NOT EDIT
          # YOUR EDITS WILL BE OVERWRITTEN
          bind r source-file ${symlinkPath}/${rootConfig} \; display "Config reloaded"
        '';
      };
  };
}
