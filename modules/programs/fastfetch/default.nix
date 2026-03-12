{
  username,
  config,
  pkgs,
  ...
}: let
  link = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
  configPath = config.var.path.flake + "/modules/programs/fastfetch/dotfiles";
in {
  environment.systemPackages = with pkgs; [fastfetch];

  home-manager.users.${username} = {
    xdg.configFile = {
      "fastfetch/config.jsonc".source = link configPath + "/config.jsonc";
      "fastfetch/logo.txt".source = link configPath + "/logo.txt";
    };
  };
}
