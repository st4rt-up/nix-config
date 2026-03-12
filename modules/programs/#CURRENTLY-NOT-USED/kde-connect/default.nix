_: {
  networking.firewall = [
    {
      from = 1714;
      to = 1764;
    }
  ];

  programs.kdeconnect.enable = true;
}
