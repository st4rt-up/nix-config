# currently requires home-manager
{username, ...}: {
  imports = [
    ./nvf
  ];

  home-manager.users.${username} = {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
