{
  username,
  inputs,
  ...
}: {
  home-manager.users.${username} = {
    programs.git = {
      enable = true;

      userName = inputs.nix-secrets.git.personal.name;
      userEmail = inputs.nix-secrets.git.personal.email;

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
