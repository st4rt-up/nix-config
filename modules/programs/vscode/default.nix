{username, ...}: {
  home-manager.users.${username} = {
    programs.vscode.enable = true;
  };
}
