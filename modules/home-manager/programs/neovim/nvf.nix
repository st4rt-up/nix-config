{nixpkgs, ...}: {
  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;

      lineNumberMode = "number";

      options = {
        tabstop = 2;
        shiftwidth = 2;
      };

      lazy.enable = true;
      telescope.enable = true;

      lsp = {
        formatOnSave = true;

        lightbulb.enable = true;
        trouble.enable = true;

        lspSignature.enable = true;
        lsplines.enable = true;
      };

      languages = {
        enableLSP = true;
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix = {
          enable = true;
          lsp.server = "nixd";
          treesitter.enable = false;
          lsp.options = {
            nixpkgs = {expr = "import <nixpkgs> { }";};
            formatting.command = ["alejandra"];
          };
        };

        rust.enable = true;
      };
    };
  };
}
