{inputs, ...}: {
  imports = [
    ./nvf.nix
    ./nvf-plugins.nix
    ./nvf-languages.nix
    ./nvf-treesitter.nix

    inputs.nvf.homeManagerModules.default
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
