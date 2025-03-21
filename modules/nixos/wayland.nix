{...}: {
  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
  };

  services.displayManager.autoLogin = {
    enable = true;
    user = "kai";
  };
}
