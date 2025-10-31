{username, ...}: {
  home-manager.users.${username} = {
    programs.git = {
      enable = true;

      userName = "Kai R"; # replace with soft secret in flake
      userEmail = "stfourrtup@gmail.com"; # replace with soft secret in flake

      diff-so-fancy = {
        enable = true;
        markEmptyLines = false;
        pagerOpts = ["--patch"];
      };

      extraConfig = {
        #thanks "Configure Your Git" - codingjerk
        # https://www.youtube.com/watch?v=G3NJzFX6XhY
        core = {
          compression = "9";
          whitespace = "error";
        };

        advice = {
          pushNonFastForward = false;
          # statusHints = false;
        };

        status = {
          branch = true;
          showStash = true;
          showUntrackedFiles = "all";
        };

        diff = {
          context = 3;
          renames = "copies";
          interHunkContext = 10;
        };

        interactive = {
          singlekey = true;
        };

        init = {
          defaultBranch = "main";
        };
      };
    };

    home.shellAliases = {
      "ga" = "git add --patch";
      "gc" = "git commit";
      "gcm" = "git commit -m";
      "gs" = "git status;git log --oneline -4";
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
