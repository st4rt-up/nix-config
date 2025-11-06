{
  username,
  config,
  ...
}: let
  inherit (config.home-manager.users.${username}.home) homeDirectory;
in {
  home-manager.users.${username} = {
    programs.bash = {
      enable = true;
    };
  };
}
