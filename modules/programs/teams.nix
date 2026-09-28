{
  modules.ms-teams.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      teams-for-linux
    ];
  };
}
