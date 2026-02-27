{
  username,
  config,
  pkgs,
  ...
}: let
  configPath = config.var.path.flake + "/modules/programs/yazi/dotfiles";
  outOfStore = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
in {
  environment.systemPackages = with pkgs; [yazi];
  environment.sessionVariables = {
    YAZI_CONFIG_HOME = "~/.config/yazi";
  };

  home-manager.users.${username} = {
    xdg.configFile."yazi".source = outOfStore configPath;
  };
}
