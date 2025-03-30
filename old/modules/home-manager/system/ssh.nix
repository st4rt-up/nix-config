{...}: {
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "github" = {
        host = "gitlab.com github.com";
        identitiesOnly = true;
        identityFile = [
          "~/.ssh/git"
        ];
      };
    };
  };
}
