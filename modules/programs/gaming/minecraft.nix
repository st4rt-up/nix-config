{
  modules.minecraft-java.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      prismlauncher
    ];

    networking.firewall = {
      allowedTCPPorts = [25565];
      allowedUDPPortRanges = [
        {
          from = 25565;
          to = 25565;
        }
      ];
    };
  };

  modules.minecraft-bedrock.nixos = {pkgs, ...}: {
    environment.systemPacakges = with pkgs; [
      mcpelauncher-client
      mcpelauncher-ui-qt
    ];
  };
}
