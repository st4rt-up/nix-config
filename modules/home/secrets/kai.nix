{
  inputs,
  var,
  ...
}: let
  home-dir = "/home/${var.username}";
  sopsFolder = builtins.toString inputs.nix-secrets;
in {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    age.keyFile = "${home-dir}/.config/sops/age/keys.txt";
    defaultSopsFile = "${sopsFolder}/secrets.yaml";
    secrets = {
      "secrets/ssh-key/github-ssh" = {
        path = "${home-dir}/.ssh/github-ssh";
      };
    };
  };
}
