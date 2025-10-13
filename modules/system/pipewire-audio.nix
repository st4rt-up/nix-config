{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wireplumber # change volume with command
    alsa-utils # change microphone volume
  ];
  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;
  };
}
