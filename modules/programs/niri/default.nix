{
  username,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    niri
    xwayland-satellite
  ];

  programs.niri.enable = true;
  services.gnome.gcr-ssh-agent.enable = false;

  home-manager.users.${username} = {
    xdg.configFile."niri/config.kdl".source = ./config.kdl;
    programs.niriswitcher.enable = true;
  };
}
