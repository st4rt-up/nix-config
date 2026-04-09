{pkgs, ...}: {
  systemd = {
    services = {
      NetworkManager-wait-online.enable = false;
      systemd-udev-settle.enable = false;
    };
  };
  boot = {
    kernelPackages = pkgs.pkgs.linuxPackages_6_12;
    loader = {
      systemd-boot = {
        enable = true;
        # editor = false;
      };
      efi.canTouchEfiVariables = true;

      # mash space for boot menu
      # thanks https://github.com/sioodmy/dotfiles/blob/main/system/boot/default.nix
      timeout = 0;
    };

    # Silent boot
    # thanks https://github.com/anotherhadi/nixy/blob/main/nixos/systemd-boot.nix

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
}
