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
        fold = true;

        grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          nix

          c
          cpp
          java
          rust
          vhdl

          markdown
          latex

          mermaid # flowchart markup lang
        ];

        indent.disable = [
          "vhdl"
        ];
      };
    };
  };
}
