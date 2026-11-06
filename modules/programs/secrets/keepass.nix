{
  modules.keepass.home = {pkgs, ...}: {
    programs.keepassxc = {
      enable = true;
      autostart = true;
    };

    programs.zen-browser.nativeMessagingHosts = [pkgs.keepassxc];

    xdg.autostart.enable = true;
  };
}
