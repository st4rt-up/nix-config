{pkgs, ...}: {
  programs.nvf = {
    settings.vim = {
      lsp.servers = {
      nixd.filetypes = [
      "nix"];
      clangd.filetypes = [
        "c"
        "cpp"
      ];
      };
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
        enableDAP = true;

        nix = {
          enable = true;
          treesitter.enable = false;

          lsp = {
            enable = true;
            server = "nixd";

            options = {
              nixpkgs = {expr = "import <nixpkgs> { }";};
              formatting.command = ["alejandra"];
            };
          };
        };

        rust = {
          enable = true;
          # crates.enable = true;
        };

        clang = {
          enable = true;
          cHeader = true;

          treesitter.enable = true;

          lsp = {
            enable = true;
            package = pkgs.clang-tools_16;
            server = "clangd";
          };

          dap = {
            enable = true;
          };
        };
      };
    };
  };
}
