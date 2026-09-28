{
  modules.networkmanager = {
    nixos = _: {
      networking = {
        /*
        firewall = {
          enable = true;
          allowedTCPPorts = [80 443];
        };
        */
        networkmanager.enable = true;
      };
    };

    user = {
      extraGroups = ["networkmanager"];
    };
  };
}
