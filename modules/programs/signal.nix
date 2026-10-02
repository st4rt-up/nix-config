{
  modules = {
    signal.nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        signal-desktop
      ];
    };

    signal-cli.nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        signal-cli
      ];
    };
  };
}
