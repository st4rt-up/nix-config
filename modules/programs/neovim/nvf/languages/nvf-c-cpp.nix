{
  username,
  pkgs,
  ...
}: {
  home-manager.users.${username} = {
    programs.nvf.settings.vim = {
      languages.clang = {
        enable = true;
        treesitter.enable = true;
        cHeader = true;
        lsp.enable = true;
        dap.enable = true;
      };

      lsp.servers.clangd = {
        filetypes = ["h" "hpp" "c" "cpp"];
        root_markers = [".git"];
      };

      treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        c
        cpp
      ];
    };
  };
}
