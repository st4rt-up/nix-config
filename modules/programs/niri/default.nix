{
  username,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    niri
  ];
  programs.niri.enable = true;
  home-manager.users.${username} = {
    xdg.configFile."niri/config.kdl" = ./config.kdl;
    programs.niriswitcher.enable = true;
  };
}
