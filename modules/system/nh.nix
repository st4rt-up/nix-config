{
  modules.nh.nixos = {
    programs.nh = {
      enable = true;
      # clean.enable = true;
      # clean.extraArgs = "--keep-since 30d --keep 10";
    };
  };
}
