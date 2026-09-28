{
  modules = {
    signal.nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        signal-desktop-bin
      ];
    };

    signal-cli.nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        signal-cli
      ];
    };
  };
}
