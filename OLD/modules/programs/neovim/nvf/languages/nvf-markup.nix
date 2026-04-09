{
  username,
  pkgs,
  ...
}: {
  home-manager.users.${username} = {
    programs.nvf.settings.vim = {
      languages.markdown = {
        enable = true;
        format.enable = false;
        extensions.render-markdown-nvim.enable = true;
      };

      treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        markdown
        latex

        json
        csv
        mermaid
      ];
    };
  };
}
