{
  config,
  hostname,
  ...
}: {
  imports = [
    ./core-packages.nix

    ./options-host.nix
    ./options-theme.nix

    ./ssh-agent.nix
    ./stylix.nix
    ./nix.nix
    ./user.nix
  ];

  networking = {
    hostName = hostname;
    networkmanager.enable = true;
  };

  time = {
    timeZone = config.var.timezone;
  };
}
