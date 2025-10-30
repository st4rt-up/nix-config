{
  username,
  config,
  ...
}: {
  programs.yazi = {
    enable = true;
  };

  home-manager.users.${username} = {
    home.file = {
      ".config/yazi" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/yazi";
      };
    };
  };
}
