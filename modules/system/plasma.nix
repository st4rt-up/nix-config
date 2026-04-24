{
  modules.plasma.nixos = {
    services = {
      desktopManager.plasma6.enable = true;
      # displayManager.plasma-login-manager.enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        enableHidpi = true;
        settings = {
          Autologin = {
            Session = "plasma.desktop";
            User = "john";
          };
        };
      };
    };
  };
}
