{
  username,
  config,
  pkgs,
  ...
}: let
  configPath = config.var.flake-path + "/modules/programs/yazi/dotfiles";
  outOfStore = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
in {
  environment.systemPackages = with pkgs; [yazi];
  environment.sessionVariables = {
    YAZI_CONFIG_HOME = "~/.config/yazi";
  };

  home-manager.users.${username} = {
    stylix.targets.yazi.enable = false;
    xdg.configFile."yazi".source = outOfStore configPath;
  };
}
