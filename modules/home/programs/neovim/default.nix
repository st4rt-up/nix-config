{inputs, ...}: {
  imports = [
    ./nvf.nix
    ./nvf-plugins.nix

    inputs.nvf.homeManagerModules.default
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
