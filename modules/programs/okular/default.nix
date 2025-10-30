{
  pkgs,
  username,
  ...
}: {
  environment.systemPackages = with pkgs; [
    kdePackages.okular
  ];

  home-manager.users.${username} = {
    stylix.targets.kde.enable = false;
  };
}
