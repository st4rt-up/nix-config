{
  config,
  hostname,
  ...
}: {
  imports = [
    ./core-packages.nix
    ./options-host.nix
    ./ssh-agent.nix
    ./nix.nix
    ./user.nix
  ];

  networking = {
    hostName = hostname;
    networkmanager.enable = true;
  };

  time = {
    timeZone = config.var.timezone;
    hardwareClockInLocalTime = true;
  };
}
