{
  inputs,
  system,
  ...
}: {
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia.modesetting.enable = true;
  };

  programs = {
    hyprland.enable = true;
    # xwayland.enable = true;
  };

  environment.systemPackages = [
    inputs.rose-pine-hyprcursor.packages.${system}.default
  ];

  # services.displayManager.autoLogin = {
  #   enable = true;
  #   user = "kai";
  # };

  security.pam.services.hyprlock = {};

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
