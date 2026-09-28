{
  modules.nvf-rust = {
    nixos = {
      programs.nvf.settings.vim = {
        languages.rust = {
          enable = true;
        };
      };
    };
  };
}
