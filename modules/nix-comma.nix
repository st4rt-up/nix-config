{inputs, ...}: {
  modules.nix-comma.nixos = {
    imports = [inputs.nix-index-database.nixosModules.nix-index];
    programs.nix-index-database.comma.enable = true;
    programs.nix-ld.enable = true;
  };
}
