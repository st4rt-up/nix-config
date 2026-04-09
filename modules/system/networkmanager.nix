{
  modules.networkmanager = {
    nixos = _: {
      networking.networkmanager.enable = true;
    };

    user = {
      extraGroups = ["networkmanager"];
    };
  };
}
