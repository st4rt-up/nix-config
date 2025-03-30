{...}: {
  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
  };

  services.displayManager.autoLogin = {
    enable = true;
    user = "kai";
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.hyprland.enable = true;
}
