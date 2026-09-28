{
  modules.noctalia.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      noctalia-shell
    ];
  };
}
