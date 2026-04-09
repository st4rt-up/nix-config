{
  username,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    alejandra
    nixd
  ];

  home-manager.users.${username} = {
    programs.nvf.settings.vim = {
      languages.nix = {
        enable = true;
        extraDiagnostics.enable = true;
        treesitter.enable = true;

        format.enable = true;
        format.type = ["alejandra"];

        lsp.enable = true;
        lsp.servers = ["nixd"];
      };

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
    };
  };
}
