{username, ...}: {
  home-manager.users.${username} = {
    programs.nvf = {
      settings.vim = {
        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;
          enableDAP = true;

          nix = {
            enable = true;
            extraDiagnostics.enable = true;
            treesitter.enable = true;
            format.enable = true;
            format.type = "alejandra";
          };
        };
      };
    };
  };
}
