{
  modules.quiet-boot.nixos = {
    boot = {
      loader.timeout = 0;
      consoleLogLevel = 3;
      kernelParams = [
        "quiet"
        "splash"
        "vga=current"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
      ];

      initrd = {
        verbose = false;
        systemd.enable = true;
      };
    };
  };
}
