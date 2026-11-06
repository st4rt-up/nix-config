{
  modules.plasma.nixos = {
    #services.displayManager.plasma-login-manager.enable = true;
    services.desktopManager.plasma6.enable = true;
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      enableHidpi = true;
      # settings = { };
    };
  };
}
