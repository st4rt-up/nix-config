{lib, ...}: let
  inherit (builtins) elem;
  inherit (lib) getName;
in {
  modules.steam.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      mangohud
      protonup-qt
    ];

    nixpkgs.config.allowUnfree = true;

    nixpkgs.config.allowUnfreePredicate = pkg:
      elem (getName pkg) [
        "steam"
        "steam-unwrapped"
        "steam-original"
        "steam-run"
      ];
    programs = {
      steam = {
        enable = true;

        package = pkgs.steam.override {
          extraArgs = "-system-composer";
        };

        gamescopeSession.enable = true;

        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };

      gamemode.enable = true;
      gamescope.enable = true;
    };
  };
}
