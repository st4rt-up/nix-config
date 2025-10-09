{var, ...}: {
  programs.bash = {
    enable = true;

    shellAliases = {
      "nixedit" = "cd ${var.config-directory} && sudo nvim";
    };
  };

  stylix.targets.yazi.enable = false;
}
