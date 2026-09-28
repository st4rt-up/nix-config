{
  modules.tor-browser.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      tor-browser
    ];
  };
}
