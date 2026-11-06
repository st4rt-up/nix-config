{
  modules.firefox.nixos = {pkgs, ...}: {
    environment.sessionVariables = {
      MOZ_USE_XINPUT2 = "1";
    };

    environment.systemPackages = with pkgs; [
      firefox
    ];
  };
}
