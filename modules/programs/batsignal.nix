{inputs, ...}: {
  modules.batsignal.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      batsignal
    ];
  };
}
