{inputs, ...}: let
  sopsFolder = builtins.toString inputs.nix-secrets;
in {
  sops = {
    age.sshKeyPaths = [
      "/etc/ssh/ssh_host_ed25519_key"
      #      "/home/${username}/.ssh/id_ed25519"
    ];

    defaultSopsFile = "${sopsFolder}/secrets.yaml";
    validateSopsFiles = false;
  };
}
