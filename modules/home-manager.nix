{
  modules.home-manager = {
    home = {
      programs.home-manager.enable = true;
    };
    # internal use only
    user.home-manager.enable = true;
  };
}
