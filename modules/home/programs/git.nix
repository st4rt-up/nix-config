{...}: {
  programs.git = {
    enable = true;

    userName = "Kai R";
    userEmail = "stfourrtup@gmail.com";
  };

  home.shellAliases = {
    "ga" = "git add";
    "gc" = "git commit -m";
  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github-personal" = {
        hostname = "github.com";
        user = "git";
        # preferredAuthentications = "publickey";
        identityFile = "~/.ssh/github-ssh";
      };

      #    "git-school" = {
      #      hostname = "github.com";
      #      identityFile = "~/.ssh/github-school-ssh";
      #    };
    };
  };
}
