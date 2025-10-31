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
      # ".config/yazi.toml".source = outOfStore programPath + "yazi.toml";
      ".config/keymap.toml".source = outOfStore configPath + "keymap.toml";
      # ".config/theme.toml".source = outOfStore programPath + "theme.toml";
    };
  };
}
