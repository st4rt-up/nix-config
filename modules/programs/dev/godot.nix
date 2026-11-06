{
  modules.godot.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      godot
    ];
  };
}
