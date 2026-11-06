{
  modules.greetd.nixos = {
    config,
    pkgs,
    ...
  }: {
    environment.systemPackages = with pkgs; [tuigreet];
    services.greetd = {
      enable = true;
      settings.terminal.vt = 1;
      settings = {
        default_session = {
          user = "greeter";
          #command = "${pkgs.tuigreet}/bin/tuigreet --greeting 'nixos' --remember --remember-user-session --time --cmd ${session}";
          command = "${pkgs.tuigreet}/bin/tuigreet --sessions ${config.services.displayManager.sessionData.desktops}/share/xsessions:${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --remember --remember-user-session";
        };
      };
    };
  };
}
