{
  inputs,
  system,
  ...
}: {
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia.modesetting.enable = true;
  };
}
