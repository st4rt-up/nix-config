{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wireplumber # change volume with command
  ];
  services.pulseaudio.enable = false;

  #sound.enable = true;
  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;

    pulse.enable = true;

    jack.enable = true;
  };
}
