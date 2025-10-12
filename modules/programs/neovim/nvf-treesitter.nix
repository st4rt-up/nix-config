{
  username,
  pkgs,
  ...
}: {
  home-manager.users.${username} = {
    programs.nvf.settings.vim = {
      treesitter = {
        enable = true;
        # context.enable = true;
        highlight.enable = true;

        textobjects.enable = true;
        # fold = true;

        grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          vhdl
          rust
          # nix
          cpp
          c
        ];
      };
    };
  };
}
