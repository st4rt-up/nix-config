{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    mangohud
    protonup-qt
    lutris
    bottles
  ];

  programs = {
    steam = {
      enable = true;

      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    gamemode = true;
  };
}
