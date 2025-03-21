{ ... }: {
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;

    # mash space for boot menu
    # thanks https://github.com/sioodmy/dotfiles/blob/main/system/boot/default.nix
    timeout = 0;
  };
} 