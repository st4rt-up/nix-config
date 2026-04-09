{username, ...}: {
  home-manager.users.${username} = {
    programs = {
      diff-so-fancy = {
        enable = true;
        enableGitIntegration = true;

        settings.markEmptyLines = false;
        # settings.pagerOpts = ["--patch"];
      };
      git = {
        enable = true;
        settings = {
          #thanks "Configure Your Git" - codingjerk
          # https://www.youtube.com/watch?v=G3NJzFX6XhY
          core.compression = "9";
          core.whitespace = "error";

          advice.pushNonFastForward = false;
          # advice.statusHints = false;

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

          interactive.singlekey = true;
          init.defaultBranch = "main";
        };
      };
    };
  };
}
