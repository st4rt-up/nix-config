{
  username,
  pkgs,
  ...
}: {
  home-manager.users.${username} = {
    programs.nvf.settings.vim = {
      languages.python.enable = true;
      treesitter.grammars = [pkgs.vimPlugins.nvim-treesitter.builtGrammars.python];
    };
  };
}
