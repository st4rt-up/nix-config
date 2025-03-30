{
  inputs,
  system,
  ...
}: {
  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
  };

  programs.hyprland.enable = true;

  environment.systemPackages = [
    inputs.rose-pine-hyprcursor.packages.${system}.default
  ];

  services.displayManager.autoLogin = {
    enable = true;
    user = "kai";
  };

  security.pam.services.hyprlock = {};

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
