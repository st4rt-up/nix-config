{
  modules.librewolf = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        librewolf
      ];
    };

    home.programs.librewolf = {
      enable = true;
    };
  };
}
