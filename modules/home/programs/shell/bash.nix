{ ... }: {
  programs.bash = {
    enable = true;

    shellAliases = {
      "nixedit" = "cd ~/nix-config && sudo nvim";

    };

  };
}
