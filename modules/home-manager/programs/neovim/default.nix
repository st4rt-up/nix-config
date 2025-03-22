{inputs, ...}: {
  imports = [
    ./neovim.nix
    ./nvf.nix
    ./nvf-plugins.nix
    inputs.nvf.homeManagerModules.default
  ];
}
