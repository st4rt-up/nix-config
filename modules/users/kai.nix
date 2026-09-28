{
  config,
  lib,
  inputs,
  ...
}: let
  inherit
    (lib)
    # mkDefault
    mkIf
    ;
in {
  configurations.users.kai = _: {
    imports = with config.modules; [
      kai
      # for user groups
      networkmanager
      admin
      pipewire

      firefox
      zen-browser
      tor-browser
      signal
      nixcord
      steam
      minecraft
      ms-teams

      github-secrets
      keepass

      shell-utils
      zoxide
      tmux
      ssh-agent
      rose-pine-cursor

      home-manager
    ];
  };

  modules.kai = {
    nixos = {config, ...}: {
      imports = [inputs.sops-nix.nixosModules.sops];
      sops = {
        age.keyFile = "/home/kai/.config/sops/age/keys.txt";
        age.generateKey = true;
        defaultSopsFile = "${inputs.nix-secrets}/secrets.yaml";
        validateSopsFiles = false;
      };

      services.greetd.settings = mkIf config.services.greetd.enable {
        initial_session.user = "kai";
        default_session.user = "kai";
      };
    };

    user = {
      initialPassword = "password";
    };
  };
}
