{ inputs, pkgs, config, ...} : {

  environment.systemPackages = with pkgs; [ sops ];
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = ./../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    validateSopsFiles = false;

    age = {
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];

      keyFile = "~/.config/sops/age/keys.txt";

      generateKey = true;
    };

    secrets = {};
  };
}