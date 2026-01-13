{
  username,
  pkgs,
  ...
}: {
  home-manager.users.${username} = {
    programs.nvf.settings.vim = {
      languages.rust = {
        enable = true;
        # crates.enable = true;
      };

      treesitter.grammars = [pkgs.vimPlugins.nvim-treesitter.builtGrammars.rust];
    };
  };
}
