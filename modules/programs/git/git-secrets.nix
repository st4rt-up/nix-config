{
  username,
  inputs,
  ...
}: {
  home-manager.users.${username} = {
    git = {
      user = {
        inherit (inputs.nix-secrets.git.personal) name email;
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
