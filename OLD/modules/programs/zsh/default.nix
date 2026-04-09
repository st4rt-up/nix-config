{
  username,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    zsh
  ];

  home-manager.users.${username} = {
    programs.zsh = {
      enable = true;
    };
  };
}
