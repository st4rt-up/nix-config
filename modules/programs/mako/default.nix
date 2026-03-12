# currently requires home-manager
{
  username,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [libnotify];
  home-manager.users.${username} = {
    services.mako = {
      enable = true;
      settings = {
        default-timeout = 5 * 1000;
      };
    };
  };
}
