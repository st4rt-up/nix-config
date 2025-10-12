{
  inputs,
  username,
  ...
}: let
  home-dir = "/home/${username}";
  sopsFolder = builtins.toString inputs.nix-secrets;
in {
  home-manager.users.${username} = {
    imports = [
      inputs.sops-nix.homeManagerModules.sops
    ];
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

        "secrets/ssh-key/github-school" = {
          path = "${home-dir}/.ssh/github-school";
        };
      };
    };
  };
}
