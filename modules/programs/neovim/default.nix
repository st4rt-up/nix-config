{
  username,
  inputs,
  ...
}: {
  imports = [
    ./nvf.nix
    ./nvf-plugins.nix
    ./nvf-languages.nix
    ./nvf-treesitter.nix
    ./nvf-binds.nix
  ];

  home-manager.users.${username} = {
    imports = [inputs.nvf.homeManagerModules.default];
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
