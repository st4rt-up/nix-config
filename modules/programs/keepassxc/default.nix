{
  username,
  config,
  ...
}: let
  outOfStore = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
  configPath = config.var.flake-path + "/modules/programs/keepassxc/dotfiles";
in {
  home-manager.users.${username} = {
    programs.keepassxc = {
      enable = true;
      autostart = true;
    };
    xdg.autostart.enable = true;

    xdg.configFile = {
      "keepassxc/keepassxc.ini".source = outOfStore configPath + "/keepassxc.ini";
    };
  };
}
