{
  modules.minecraft.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      prismlauncher
      mcpelauncher-client
      mcpelauncher-ui-qt
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
}
