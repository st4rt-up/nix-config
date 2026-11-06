{
  modules.aseprite.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      aseprite
    ];
  };
}
