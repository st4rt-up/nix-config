{
  username,
  pkgs,
  ...
}: {
  home-manager.users.${username} = {
    programs.nvf.settings.vim = {
      languages.lua.enable = true;

      treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        lua
      ];
    };
  };
}
