{
  username,
  pkgs,
  ...
}: {
  home-manager.users.${username} = {
    programs.nvf.settings.vim = {
      lsp.servers.vhdl-ls = {
        cmd = ["vhdl_ls"];
        filetypes = ["vhdl" "vhd"];
      };

      # treesitter.indent.disable = ["vhdl"];
      treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [vhdl];
    };
  };
}
