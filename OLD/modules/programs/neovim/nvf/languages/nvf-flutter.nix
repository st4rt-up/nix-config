{
  username,
  pkgs,
  ...
}: {
  home-manager.users.${username} = {
    programs.nvf.settings.vim = {
      languages.dart = {
        enable = true;
        lsp.enable = true;
        dap.enable = true;
        treesitter.enable = true;
        flutter-tools = {
          color.enable = true;
          color.virtualText.enable = true;
        };
      };

      treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        dart
      ];
    };
  };
}
