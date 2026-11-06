{
  modules.direnv.nixos = {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;

      silent = true;

      settings = {
        global.hide_env_diff = true;
      };
    };
  };
}
