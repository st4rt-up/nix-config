{...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.shellAliases = {
    "sudoedit" = "sudo nvim";

  };
}
