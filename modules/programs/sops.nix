{inputs, ...}: {
  modules.sops.nixos = {
    imports = [
      inputs.sops-nix.nixosModules.sops
    ];

    sops = {
      age.sshKeyPaths = [
        "/etc/ssh/ssh_host_ed25519_key"
      ];

      defaultSopsFile = "${inputs.nix-secrets}/secrets.yaml";
      validateSopsFiles = false;
    };
  };
}
