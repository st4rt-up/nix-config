{config, ...}: {
  modules.krita.nixos = {pkgs, ...}: {
    imports = with config.modules; [
      drawing-tablet.nixos
    ];

    environment.systemPackages = with pkgs; [
      krita
    ];
  };
}
