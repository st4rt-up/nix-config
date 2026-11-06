{
  modules.git.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      git
    ];
  };
}
