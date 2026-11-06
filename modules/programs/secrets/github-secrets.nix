{inputs, ...}: let
  sopsFolder = toString inputs.nix-secrets;
in {
  modules.github-secrets.home = {
    imports = [inputs.sops-nix.homeManagerModules.sops];
    programs.git.settings.user = {
      inherit (inputs.nix-secrets.git.personal) name email;
    };

    sops = {
      age.keyFile = "~/.config/sops/age/keys.txt";
      age.generateKey = true;

      defaultSopsFile = "${sopsFolder}/secrets.yaml";
      validateSopsFiles = true;

      secrets = {
        "secrets/ssh-key/github-personal".path = "~/.ssh/github-personal";
        "secrets/ssh-key/github-uo".path = "~/.ssh/github-uo";
      };
    };

    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings = {
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
}
