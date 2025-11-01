{
  username,
  config,
  ...
}: let
  configPath = config.var.flake-path + "/modules/programs/yazi/dotfiles";
  outOfStore = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
in {
  programs.yazi = {
    enable = true;
  };

  home-manager.users.${username} = {
    home.file = {
      # ".config/yazi/yazi.toml".source = outOfStore configPath + "yazi.toml";
      ".config/yazi/keymap.toml".source = outOfStore configPath + "keymap.toml";
      # ".config/yazi.theme.toml".source = outOfStore configPath + "theme.toml";
    };
  };
}
