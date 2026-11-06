{config, ...}: {
  modules.labwc.nixos = {pkgs, ...}: {
    imports = with config.modules; [
      # stasis.nixos
      wayland.nixos
      clipboard-wayland.nixos
      nautilus.nixos
    ];
    environment.systemPackages = with pkgs; [
      labwc
      labwc-tweaks
      xwayland-satellite
    ];
    services.displayManager = {
      sessionPackages = [pkgs.labwc];
    };
    xdg.portal.configPackages = [pkgs.labwc];
  };
}
