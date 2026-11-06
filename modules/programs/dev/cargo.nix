{
  modules.cargo.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      rustup

      rustfmt
      cargo
      clippy
    ];
  };
}
