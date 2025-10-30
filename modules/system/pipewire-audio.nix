{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wireplumber # change volume with command
    alsa-utils # change microphone volume

    pavucontrol
    pamixer
  ];

  security.rtkit.enable = true;
  services.pulseaudio.enable = false;

  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    # jack.enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;
    socketActivation = true;
  };
}
