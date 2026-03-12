{
  username,
  pkgs,
  ...
}: {
  home-manager.users.${username} = {
    programs.nvf.settings.vim = {
      languages.java = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };

      treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [java];
    };
  };
}
