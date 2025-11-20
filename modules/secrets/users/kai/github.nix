{
  # config,
  # lib,
  inputs,
  username,
  ...
}: let
  # inherit (lib) mkIf;
  home-dir = "/home/${username}";
  sopsFolder = builtins.toString inputs.nix-secrets;
in {
  home-manager.users.${username} = {
    imports = [
      inputs.sops-nix.homeManagerModules.sops
    ];
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "*" = {};
        "github-personal" = {
          hostname = "github.com";
          user = "git";
          identityFile = "~/.ssh/github-personal";
          identitiesOnly = true;
        };
        "github-uo" = {
          hostname = "github.com";
          user = "git";
          identityFile = "~/.ssh/github-uo";
          identitiesOnly = true;
        };
      };
    };

    sops = {
      age = {
        keyFile = "${home-dir}/.config/sops/age/keys.txt";
        generateKey = true;
      };

      defaultSopsFile = "${sopsFolder}/secrets.yaml";
      validateSopsFiles = true;

      secrets = {
        "secrets/ssh-key/github-personal" = {
          path = "${home-dir}/.ssh/github-personal";
        };

        "secrets/ssh-key/github-uo" = {
          path = "${home-dir}/.ssh/github-uo";
        };
      };
    };
  };
}
