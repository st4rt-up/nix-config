{
  modules.intellij.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      jetbrains.idea
    ];
  };
}
