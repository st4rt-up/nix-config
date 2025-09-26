_: {
  programs.git = {
    enable = true;

    userName = "Kai R";
    userEmail = "stfourrtup@gmail.com";
  };

  home.shellAliases = {
    "ga" = "git add";
    "gc" = "git commit -m";
    "gs" = "git status";
  };

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
}
