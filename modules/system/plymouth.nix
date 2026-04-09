{config, ...}: {
  modules.plymouth.nixos = {
    imports = with config.modules; [
      quiet-boot.nixos
    ];
    boot.plymouth.enable = true;
  };
}
