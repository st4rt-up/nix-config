{
  modules.nvf-java.nixos =
    #{pkgs, ...}
    _: {
      /*
      environment.systemPackages = with pkgs; [
        alejandra
        nixd
      ];
      */

      programs.nvf.settings.vim = {
        languages.java = {
          enable = true;
          treesitter.enable = true;

          format.enable = true;
          lsp.enable = true;
        };
      };
    };
}
