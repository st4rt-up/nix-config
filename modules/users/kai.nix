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

      # == user groups
      networkmanager
      admin
      pipewire
      adb

      # firefox
      zen-browser
      # tor-browser
      obsidian
      clipboard-wayland

      # messaging
      nixcord
      ms-teams
      signal
      # signal-cli

      # == games
      steam
      # minecraft-java
      # minecraft-bedrock
      osu-lazer

      # == secrets
      keepass
      github-secrets

      # == shell
      tmux
      zoxide
      shell-utils
      ssh-agent

      # == theming
      rose-pine-cursor
      stylix
      stylix-fonts
      stylix-icons
      stylix-colours
      stylix-fuzzel

      # == home-manager config
      alacritty
      fuzzel
      yazi
      okular
      stasis-framework

      # ==
      home-manager
    ];
  };

  modules.kai = {
    nixos = {
      imports = [inputs.sops-nix.nixosModules.sops];
      sops = {
        age.keyFile = "/home/kai/.config/sops/age/keys.txt";
        age.generateKey = true;
        defaultSopsFile = "${inputs.nix-secrets}/secrets.yaml";
        validateSopsFiles = false;
      };
    };

    user = {
      initialPassword = "password";
    };
  };
}
