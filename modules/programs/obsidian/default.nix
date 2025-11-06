{
  pkgs,
  username,
  ...
}: {
  environment.systemPackages = with pkgs; [
    obsidian
    rofi-obsidian
  ];

  home-manager.users.${username} = {
    stylix.targets.obsidian.enable = false;
  };
}
