{
  modules.mako = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [libnotify];
    };

    home.services.mako = {
      enable = true;
      settings.default-timeout = 5 * 1000;
    };
  };
}
