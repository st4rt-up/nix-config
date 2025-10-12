{username, ...}: {
  home-manager.users.${username} = {
    programs.git = {
      enable = true;

      userName = "Kai R"; # replace with soft secret in flake
      userEmail = "stfourrtup@gmail.com"; # replace with soft secret in flake

      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    home.shellAliases = {
      "ga" = "git add";
      "gc" = "git commit -m";
      "gs" = "git status";
    };

    # add ssh identities, assuming they're here from sops-nix
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "*" = {};
        "github-personal" = {
          hostname = "github.com";
          user = "git";
          identityFile = "~/.ssh/github-personal";
        };
        "github-school" = {
          hostname = "github.com";
          user = "git";
          identityFile = "~/.ssh/github-school";
        };
      };
    };
  };
}
