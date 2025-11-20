{
  username,
  inputs,
  ...
}: {
  home-manager.users.${username} = {
    home.shellAliases = {
      "ga" = "git add --patch";
      "gc" = "git commit";
      "gcm" = "git commit -m";
      "gs" = "git status;git log --oneline -4";
    };
    programs = {
      diff-so-fancy = {
        enable = true;
        enableGitIntegration = true;

        settings = {
          markEmptyLines = false;
        };
        # pagerOpts = ["--patch"];
      };
      git = {
        enable = true;
        settings = {
          user = {
            inherit
              (inputs.nix-secrets.git.personal)
              name
              email
              ;
          };
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

      # add ssh identities, assuming they're here from sops-nix
      ssh = {
        enable = true;
        enableDefaultConfig = false;
        matchBlocks = {
          "*" = {};
          "github-personal" = {
            hostname = "github.com";
            user = "git";
            identityFile = "~/.ssh/github-personal";
          };
          "github-uo" = {
            hostname = "github.com";
            user = "git";
            identityFile = "~/.ssh/github-uo";
          };
        };
      };
    };
  };
}
