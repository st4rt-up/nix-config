{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    prismlauncher
  ];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [25565];
    allowedUDPPortRanges = [
      {
        from = 25565;
        to = 25565;
      }
    ];
  };
}
