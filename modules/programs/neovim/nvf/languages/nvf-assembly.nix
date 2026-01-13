{
  username,
  # pkgs,
  ...
}: {
  home-manager.users.${username} = {
    programs.nvf.settings.vim = {
      lsp.servers = {
        asm-lsp = {
          cmd = ["asm-lsp"];
          filetypes = ["asm" "s" "S"];
        };
      };

      # treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [ ];
    };
  };
}
