{
  modules.nvf-python.nixos =
    #{pkgs, ...}
    _: {
      /*
      environment.systemPackages = with pkgs; [
        alejandra
        nixd
      ];
      */

      programs.nvf.settings.vim = {
        languages.python = {
          enable = true;
          extraDiagnostics.enable = true;
          treesitter.enable = true;

          format.enable = true;
          lsp.enable = true;
        };

        /*
        lsp.servers.nixd = {
          filetypes = ["nix"];
          init_options = {
            nixpkgs = {expr = "import <nixpkgs> { }";};
            formatting.command = ["alejandra"];
          };
        };

        treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          nix
        ];
        */
      };
    };
}
